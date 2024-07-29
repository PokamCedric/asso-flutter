import 'package:african_windows/app_bloc.dart';
import 'package:african_windows/blocs/job/job_bloc.dart';
import 'package:african_windows/models/model_dropdown_filter.dart';
import 'package:african_windows/models/model_filter.dart';
import 'package:african_windows/pages/jobs/widgets/data_table/colum_config.dart';
import 'package:african_windows/pages/jobs/widgets/data_table/data_table.dart';
import 'package:african_windows/pages/jobs/widgets/data_table/pagination_control.dart';
import 'package:african_windows/pages/jobs/widgets/filter/filter.dart';
import 'package:african_windows/pages/layout.dart';
import 'package:african_windows/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/data_table/data_table_bloc.dart';
import '../../shared/constants/ghaps.dart';

class HappiDashboardPage extends StatelessWidget {
  const HappiDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: BlocBuilder<JobListingsBloc, JobListingsState>(
        builder: (jobContext, state) {
          return BlocBuilder<DataTableBloc, DataTableState>(
            builder: (dataTableContext, dataTableState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!Responsive.isMobile(context)) gapH24,
                  Text(
                    "Dashboard de Happi",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.blueAccent),
                  ),
                  gapH20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            paginationControl(state, dataTableState),
                            gapH16,
                            Datatable(
                              data: state.filteredJobs
                                  .map((job) => job.toJson())
                                  .toList(),
                              rowsPerPage: dataTableState.rowsPerPage,
                              currentPage: dataTableState.currentPage,
                              columns: getTableColumns(),
                            ),
                            gapH16,
                            paginationControl(state, dataTableState),
                            gapH16,
                            if (Responsive.isMobile(context))
                              _filterLayout(state, filtersPerLine: 2),
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
            },
          );
        },
      ),
    );
  }

  Widget paginationControl(
      JobListingsState state, DataTableState dataTableState) {
    final totalPages = (state.totalHits / dataTableState.rowsPerPage).ceil();

    return PaginationControl(
      totalPages: totalPages,
      totalHits: state.totalHits,
      rowsPerPage: dataTableState.rowsPerPage,
      availableRowsPerPage: const [5, 10, 25, 50],
      onRowsPerPageChanged: (newRowsPerPage) =>
          AppBloc.dataTableBloc.add(ChangeRowsPerPageEvent(newRowsPerPage!)),
      currentPage: dataTableState.currentPage,
      onPageChanged: (newPage) =>
          AppBloc.dataTableBloc.add(ChangePageEvent(newPage)),
    );
  }
}

Widget _filterLayout(
  JobListingsState state, {
  int filtersPerLine = 1,
}) {
  return Filter(
    totalItems: state.filteredJobs.length,
    filtersPerLine: filtersPerLine,
    filters: getDropdownFilterModels(),
    onFilterChanged: (filters) => AppBloc.jobListingsBloc
        .add(FilterJobsEvent(FilterModel.fromJson(filters))),
  );
}

List<ColumnConfig> getTableColumns() {
  return [
    ColumnConfig(
      label: 'Titre de l\'emploi',
      propertyName: 'title',
      isVisible: true,
      width: 300.0,
    ),
    ColumnConfig(
      label: 'Type de fonction',
      propertyName: 'type',
      isVisible: true,
      width: 150.0,
    ),
    ColumnConfig(
      label: 'Pays',
      propertyName: 'country',
      isVisible: true,
    ),
    ColumnConfig(
      label: 'Domaine',
      propertyName: 'field',
      isVisible: true,
      width: 200.0,
    ),
  ];
}
