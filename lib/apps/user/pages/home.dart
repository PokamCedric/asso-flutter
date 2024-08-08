import 'package:african_windows/core/configs/app_config.dart';
import 'package:african_windows/core/models_views/breadcrumb_item.dart';
import 'package:african_windows/core/services/navigation_service.dart';
import 'package:african_windows/core/utils/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:african_windows/apps/user/data/users.dart';
import 'package:african_windows/apps/user/models_views/model_filter.dart';
import 'package:african_windows/apps/user/bloc/user_bloc.dart';
import 'package:african_windows/apps/user/data/filters.dart';
import 'package:african_windows/core/controllers/provider_filter.dart';
import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core_bloc.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';
import 'package:african_windows/core/widgets/datatable/datatable_with_pagination.dart';
import 'package:african_windows/core/blocs/datatable/datatable_bloc.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';
import 'package:african_windows/core/widgets/filter/filter.dart';

class UserListingPage extends StatelessWidget {
  const UserListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DropdownFilterModel> filters = getDropdownFilterModels();

    // Initialize filters in the provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FilterProvider>(context, listen: false).initializeFilters(filters);
    });

    void onFilterChanged(Map<String, String> newFilters) {
      Provider.of<FilterProvider>(context, listen: false).updateFilters(newFilters);
      // Trigger BLoC to fetch new data based on filters
      CoreBloc.usersBloc.add(FilterUsersEvent(FilterModel.fromJson(newFilters)));
    }

    return ResponsiveLayout(
      title: 'User Listing',
      breadcrumbItems: const [
        AppConfig.breadcrumbItemDefault,
        BreadcrumbItem(name: "Users", route: Routes.users, active: true),
      ],
      mainContent: [
        _buildDataTable(context),
      ],
      filterContent: [
        Consumer<FilterProvider>(
          builder: (context, filterProvider, child) {
            return Filter(
              filters: filters,
              selectedFilters: filterProvider.selectedFilters,
              onFilterChanged: onFilterChanged,
            );
          },
        ),
      ],
    );
  }

  Widget _buildDataTable(BuildContext context) {
    final nav = Provider.of<NavigationController>(context);

    return BlocBuilder<UsersBloc, UserListingsState>(
      builder: (userContext, userState) {
        if (userState is UserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (userState is UserErrorState) {
          return CardLayout(
            child: Center(
              child: Text(
                'An error occurred: ${userState.errorMessage}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          );
        } else if (userState is UserLoadedState) {
          return BlocBuilder<DataTableBloc, DataTableState>(
            builder: (dataTableContext, dataTableState) {
              return DataTableWithPagination(
                onAdd: () => nav.navigateTo(Routes.userAdd),
                data: userState.filteredUsers.map((user) => user.toJson()).toList(),
                headers: tableHeaders,
                rowsPerPage: dataTableState.rowsPerPage,
                currentPage: dataTableState.currentPage,
                availableRowsPerPage: const [5, 10, 25, 50],
                onEdit: (id) {
                  final selectedUser = userState.filteredUsers.firstWhere((item) => id == item.id);
                  nav.navigateTo(Routes.userEdit, arguments: selectedUser);
                },
                onPageChanged: (newPage) => CoreBloc.dataTableBloc.add(ChangePageEvent(newPage)),
                onRowsPerPageChanged: (newRowsPerPage) =>
                    CoreBloc.dataTableBloc.add(ChangeRowsPerPageEvent(newRowsPerPage!)),
              );
            },
          );
        } else {
          // If no specific state is matched, provide a fallback UI
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
}
