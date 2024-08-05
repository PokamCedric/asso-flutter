import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:african_windows/apps/user/app_bloc.dart';
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
      UsersAppBloc.userListingsBloc.add(FilterUsersEvent(FilterModel.fromJson(newFilters)));
      // Request focus on the search field
    }

    return ResponsiveLayout(
      title: 'User Listing',
      mainContent: _buildDataTable(),
      filterContent: Consumer<FilterProvider>(
        builder: (context, filterProvider, child) {
          return Filter(
            filters: filters,
            selectedFilters: filterProvider.selectedFilters,
            onFilterChanged: onFilterChanged,
          );
        },
      ),
    );
  }

  Widget _buildDataTable() {
    return BlocBuilder<UserListingsBloc, UserListingsState>(
      builder: (userContext, userState) {
        if (userState.status == UserListingsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (userState.status == UserListingsStatus.error) {
          return CardLayout(
            child: Center(child: Text('An error occurred: ${userState.errorMessage}'))
            );
        } else {
          return BlocBuilder<DataTableBloc, DataTableState>(
            builder: (dataTableContext, dataTableState) {
              return DataTableWithPagination(
                data: userState.filteredUsers.map((user) => user.toJson()).toList(),
                rowsPerPage: dataTableState.rowsPerPage,
                currentPage: dataTableState.currentPage,
                availableRowsPerPage: const [5, 10, 25, 50],
                onPageChanged: (newPage) =>
                    CoreBloc.dataTableBloc.add(ChangePageEvent(newPage)),
                onRowsPerPageChanged: (newRowsPerPage) =>
                    CoreBloc.dataTableBloc.add(ChangeRowsPerPageEvent(newRowsPerPage!)),
              );
            },
          );
        }
      },
    );
  }
}
