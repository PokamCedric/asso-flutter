import 'package:african_windows/app_bloc.dart';
import 'package:african_windows/apps/job/bloc/job_bloc.dart';
import 'package:african_windows/apps/job/data/filters.dart';
import 'package:african_windows/apps/job/models_views/model_filter.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';
import 'package:african_windows/core/widgets/datatable/datatable_with_pagination.dart';
import 'package:african_windows/core/blocs/datatable/datatable_bloc.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';
import 'package:african_windows/core/widgets/filter/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobListingPage extends StatelessWidget {
  const JobListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DropdownFilterModel> filters = getDropdownFilterModels();
    final Map<String, String> selectedFilters = {};

    for (var filter in filters) {
      if (filter.items.isNotEmpty) {
        filter.items.insert(0, 'Unselected');
        selectedFilters[filter.propertyName] = filter.items.first;
      }
    }

    // Trigger the initial load with default filters
    AppBloc.jobListingsBloc.add(FilterJobsEvent(FilterModel.fromJson(selectedFilters)));

    void onFilterChanged(Map<String, String> newFilters) {
      selectedFilters.clear();
      selectedFilters.addAll(newFilters);
      // Trigger BLoC to fetch new data based on filters
      AppBloc.jobListingsBloc.add(FilterJobsEvent(FilterModel.fromJson(selectedFilters)));
    }

    return ResponsiveLayout(
      title: 'Job Listing',
      mainContent: _buildDataTable(),
      filterContent: Filter(
        filters: filters,
        selectedFilters: selectedFilters,
        onFilterChanged: onFilterChanged,
        filtersPerLine: 1,
      ),
    );
  }

  Widget _buildDataTable() {
    return BlocBuilder<JobListingsBloc, JobListingsState>(
      builder: (jobContext, jobState) {
        if (jobState.status == JobListingsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return BlocBuilder<DataTableBloc, DataTableState>(
          builder: (dataTableContext, dataTableState) {
            return DataTableWithPagination(
              data: jobState.filteredJobs.map((job) => job.toJson()).toList(),
              rowsPerPage: dataTableState.rowsPerPage,
              currentPage: dataTableState.currentPage,
              availableRowsPerPage: const [5, 10, 25, 50],
              onPageChanged: (newPage) =>
                  AppBloc.dataTableBloc.add(ChangePageEvent(newPage)),
              onRowsPerPageChanged: (newRowsPerPage) =>
                  AppBloc.dataTableBloc.add(ChangeRowsPerPageEvent(newRowsPerPage!)),
            );
          },
        );
      },
    );
  }
}
