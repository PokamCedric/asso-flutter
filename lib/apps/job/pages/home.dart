import 'package:african_windows/app_bloc.dart';
import 'package:african_windows/apps/job/bloc/job_bloc.dart';
import 'package:african_windows/apps/job/data/filters.dart';
import 'package:african_windows/apps/job/models_views/model_filter.dart';
import 'package:african_windows/apps/job/pages/widgets/datatable_with_pagination.dart';
import 'package:african_windows/core/blocs/datatable/datatable_bloc.dart';
import 'package:african_windows/core/pages/layouts/reponsive_layout.dart';
import 'package:african_windows/core/widgets/datatable/colum_config.dart';
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
                    jobState: jobState,
                    dataTableState: dataTableState,
                    columns: _getTableColumns(),
                    onPageChanged: (newPage) {
                      AppBloc.dataTableBloc.add(ChangePageEvent(newPage));
                    },
                    onRowsPerPageChanged: (newRowsPerPage) {
                      AppBloc.dataTableBloc.add(ChangeRowsPerPageEvent(newRowsPerPage!));
                    },
                  ),
                  filterContent: _filterLayout(jobState.filteredJobs.length),
                );
              },
            );
          }
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


  List<ColumnConfig> _getTableColumns() {
    return [
      ColumnConfig(
        label: 'Job Title',
        propertyName: 'title',
        isVisible: true,
        width: 300.0,
      ),
      ColumnConfig(
        label: 'Type of Function',
        propertyName: 'type',
        isVisible: true,
        width: 150.0,
      ),
      ColumnConfig(
        label: 'Country',
        propertyName: 'country',
        isVisible: true,
      ),
      ColumnConfig(
        label: 'Field',
        propertyName: 'field',
        isVisible: true,
        width: 200.0,
      ),
    ];
}
