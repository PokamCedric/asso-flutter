import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:african_windows/apps/job/bloc/job_bloc.dart';
import 'package:african_windows/apps/job/data/filters.dart';
import 'package:african_windows/apps/job/data/jobs.dart';
import 'package:african_windows/apps/job/models_views/model_filter.dart';
import 'package:african_windows/core_bloc.dart';
import 'package:african_windows/core/controllers/provider_filter.dart';
import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';
import 'package:african_windows/core/widgets/datatable/datatable_with_pagination.dart';
import 'package:african_windows/core/blocs/datatable/datatable_bloc.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';
import 'package:african_windows/core/widgets/filter/filter.dart';

class JobListingPage extends StatelessWidget {
  const JobListingPage({super.key});

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
      CoreBloc.jobListingsBloc.add(FilterJobsEvent(FilterModel.fromJson(newFilters)));
    }

    return ResponsiveLayout(
      title: 'Job Listing',
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
    return BlocBuilder<JobListingsBloc, JobListingsState>(
      builder: (jobContext, jobState) {
        if (jobState.status == JobListingsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (jobState.status == JobListingsStatus.error) {
          return CardLayout(
            child: Center(
              child: Text('An error occurred: ${jobState.errorMessage}',
                style: TextStyle(color: Theme.of(context).colorScheme.error,)
              ))
            );
        } else {
          return BlocBuilder<DataTableBloc, DataTableState>(
            builder: (dataTableContext, dataTableState) {
              return DataTableWithPagination(
                data: jobState.filteredJobs.map((job) => job.toJson()).toList(),
                headers: tableHeaders,
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
