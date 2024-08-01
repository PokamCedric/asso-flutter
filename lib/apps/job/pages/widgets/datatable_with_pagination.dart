import 'package:african_windows/app_bloc.dart';
import 'package:african_windows/apps/job/bloc/state.dart';
import 'package:african_windows/core/blocs/datatable/event.dart';
import 'package:african_windows/core/blocs/datatable/state.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/widgets/datatable/colum_config.dart';
import 'package:african_windows/core/widgets/datatable/datatable.dart';
import 'package:african_windows/core/widgets/datatable/pagination_control.dart';
import 'package:flutter/material.dart';

class DataTableWithPagination extends StatelessWidget {
  final JobListingsState jobState;
  final DataTableState dataTableState;
  final List<ColumnConfig> columns;
  final void Function(int newPage) onPageChanged;
  final void Function(int? newRowsPerPage) onRowsPerPageChanged;

  const DataTableWithPagination({
    super.key,
    required this.jobState,
    required this.dataTableState,
    required this.columns,
    required this.onPageChanged,
    required this.onRowsPerPageChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _paginationControl(jobState, dataTableState),
        gapH16,
        CustomDataTable(
          data: jobState.filteredJobs.map((job) => job.toJson()).toList(),
          rowsPerPage: dataTableState.rowsPerPage,
          currentPage: dataTableState.currentPage,
          columns: columns,
        ),
        gapH16,
        _paginationControl(jobState, dataTableState),
      ],
    );
  }


  Widget _paginationControl(JobListingsState state,
    DataTableState dataTableState) {
    final totalPages = (state.totalHits / dataTableState.rowsPerPage).ceil();

    return PaginationControl(
        totalPages: totalPages,
        totalHits: state.totalHits,
        rowsPerPage: dataTableState.rowsPerPage,
        availableRowsPerPage: const [5, 10, 25, 50],
        onRowsPerPageChanged: (newRowsPerPage) => AppBloc.dataTableBloc.add(ChangeRowsPerPageEvent(newRowsPerPage!)),
        currentPage: dataTableState.currentPage,
        onPageChanged: (newPage) => AppBloc.dataTableBloc.add(ChangePageEvent(newPage)),
    );
  }
}
