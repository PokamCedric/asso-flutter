import 'package:african_windows/app_bloc.dart';
import 'package:african_windows/apps/job/bloc/job_bloc.dart';
import 'package:african_windows/apps/job/data/filters.dart';
import 'package:african_windows/apps/job/models_views/model_filter.dart';
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
    return BlocBuilder<JobListingsBloc, JobListingsState>(
      builder: (jobContext, jobState) {
        if (jobState.status == JobListingsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return BlocBuilder<DataTableBloc, DataTableState>(
          builder: (dataTableContext, dataTableState) {
            return ResponsiveLayout(
              title: 'Job Listing',
              mainContent: DataTableWithPagination(
                data: jobState.filteredJobs.map((job) => job.toJson()).toList(),
                rowsPerPage: dataTableState.rowsPerPage,
                currentPage: dataTableState.currentPage,
                availableRowsPerPage: const [5, 10, 25, 50],
                onPageChanged: (newPage) =>
                    AppBloc.dataTableBloc.add(ChangePageEvent(newPage)),
                onRowsPerPageChanged: (newRowsPerPage) =>
                    AppBloc.dataTableBloc.add(ChangeRowsPerPageEvent(newRowsPerPage!)),
              ),
              filterContent: _filterLayout(jobState.filteredJobs.length),
            );
          },
        );
      },
    );
  }

  Widget _filterLayout(int dataLength) {
    return Filter(
      totalItems: dataLength,
      filters: getDropdownFilterModels(),
      onFilterChanged: (filters) {
        AppBloc.jobListingsBloc.add(FilterJobsEvent(FilterModel.fromJson(filters)));
      },
    );
  }

}
