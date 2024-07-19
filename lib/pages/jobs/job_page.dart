import 'package:core_dashboard/app_bloc.dart';
import 'package:core_dashboard/blocs/job/job_bloc.dart';
import 'package:core_dashboard/models/model_dropdown_filter.dart';
import 'package:core_dashboard/models/model_filter.dart';
import 'package:core_dashboard/pages/jobs/widgets/data_table/colum_config.dart';
import 'package:core_dashboard/pages/jobs/widgets/data_table/data_table_widget.dart';
import 'package:core_dashboard/pages/jobs/widgets/filter/filter_widget.dart';
import 'package:core_dashboard/pages/layout.dart';
import 'package:core_dashboard/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/data_table/data_table_bloc.dart';
import '../../shared/constants/ghaps.dart';


class JobListingPage extends StatelessWidget {
  const JobListingPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Layout(
      child: BlocBuilder<JobListingsBloc, JobListingsState>(
        builder: (jobContext, state) {
          // if (state is Loading) {
          //   return const Center(child: CircularProgressIndicator());
          // }

          return BlocBuilder<DataTableBloc, DataTableState>(
            builder: (ataTableContext, dataTableState) {

              return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!Responsive.isMobile(context)) gapH24,
          Text(
            "Job Listing",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          gapH20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    _dataTableLayout(state, dataTableState),
                    if (Responsive.isMobile(context))
                      _filterLayout(state),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context)) gapW16,
              if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: _filterLayout(state),
                ),
            ],
          )
        ],
      );
            });
        }
    )
    );
  }

  }


  Widget _filterLayout(JobListingsState state,
    { int filtersPerLine = 1,}) {
    return FilterWidget(
      totalItems: state.filteredJobs.length,
      filterWidth: 200.0,
      filtersPerLine: filtersPerLine,
      filters: getDropdownFilterModels(),
      onFilterChanged: (filters) => AppBloc.jobListingsBloc.add(FilterJobsEvent(FilterModel.fromJson(filters))),
    );
  }

  Widget _dataTableLayout(JobListingsState state,
    DataTableState dataTableState) {
    final totalPages = (state.totalHits / dataTableState.rowsPerPage).ceil();
    return DataTableWidget(
      data: state.filteredJobs.map((job) => job.toJson()).toList(),
      rowsPerPage: dataTableState.rowsPerPage,
      currentPage: dataTableState.currentPage,
      totalPages: totalPages,
      totalHits: state.totalHits,
      availableRowsPerPage: const [5, 10, 25, 50],
      onPageChanged: (newPage) => AppBloc.dataTableBloc.add(ChangePageEvent(newPage)),
      onRowsPerPageChanged: (newRowsPerPage) => AppBloc.dataTableBloc.add(ChangeRowsPerPageEvent(newRowsPerPage!)),
      columns: getTableColumns(),
    );
  }

  List<ColumnConfig> getTableColumns() {
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


