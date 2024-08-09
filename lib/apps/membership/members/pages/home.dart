import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:african_windows/apps/membership/utils/routes.dart';
import 'package:african_windows/core/configs/app_config.dart';
import 'package:african_windows/core/models_views/breadcrumb_item.dart';
import 'package:african_windows/core/services/navigation_service.dart';
import 'package:african_windows/apps/membership/members/data/members.dart';
import 'package:african_windows/apps/membership/members/models_views/model_filter.dart';
import 'package:african_windows/apps/membership/members/bloc/member_bloc.dart';
import 'package:african_windows/apps/membership/members/data/filters.dart';
import 'package:african_windows/core/controllers/provider_filter.dart';
import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core_bloc.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';
import 'package:african_windows/core/widgets/datatable/datatable_with_pagination.dart';
import 'package:african_windows/core/blocs/datatable/datatable_bloc.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';
import 'package:african_windows/core/widgets/filter/filter.dart';


class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

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
      CoreBloc.membersBloc.add(FilterMembersEvent(FilterModel.fromJson(newFilters)));
    }

    return ResponsiveLayout(
      title: 'Members s',
      breadcrumbItems:  const [
        AppConfig.breadcrumbItemDefault,
        BreadcrumbItem(name: "Members", route: MembershipRoutes.base, active: true),
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

    return BlocBuilder<MembersBloc, MembersState>(
      builder: (memberContext, memberState) {
        if (memberState.status == MembersStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (MembersStatus.loadError == memberState.status) {
          return CardLayout(
            child: Center(
              child: Text(
                'An error occurred: ${memberState.errorMessage}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          );
        } else {
          return BlocBuilder<DataTableBloc, DataTableState>(
            builder: (dataTableContext, dataTableState) {
              return DataTableWithPagination(
                onAdd: () => nav.navigateTo(MembershipRoutes.add),
                data: memberState.filteredMembers.map((member) => member.toJson()).toList(),
                headers: tableHeaders,
                rowsPerPage: dataTableState.rowsPerPage,
                currentPage: dataTableState.currentPage,
                availableRowsPerPage: const [5, 10, 25, 50],
                onEdit: (id) {
                  final selectedMember = memberState.filteredMembers.firstWhere((item) => id == item.id);
                  nav.navigateTo(MembershipRoutes.edit, arguments: selectedMember);
                },
                //onDelete:  () => nav.navigateTo(Routes.memberDelete),
                onPageChanged: (newPage) => CoreBloc.dataTableBloc.add(ChangePageEvent(newPage)),
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
