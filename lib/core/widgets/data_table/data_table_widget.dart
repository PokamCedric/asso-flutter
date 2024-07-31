import 'package:african_windows/core/widgets/data_table/colum_config.dart';
import 'package:african_windows/core/widgets/data_table/pagination_control.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'data_table.dart';

class DataTableWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final int rowsPerPage;
  final int currentPage;
  final int totalPages;
  final int totalHits;
  final List<int> availableRowsPerPage;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int?> onRowsPerPageChanged;
  final List<ColumnConfig> columns;

  const DataTableWidget({
    super.key,
    required this.data,
    required this.rowsPerPage,
    required this.currentPage,
    required this.totalPages,
    required this.totalHits,
    required this.availableRowsPerPage,
    required this.onPageChanged,
    required this.onRowsPerPageChanged,
    required this.columns,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        paginationControl(),
        gapH16,
        Datatable(
          data: data,
          rowsPerPage: rowsPerPage,
          currentPage: currentPage,
          columns: columns,
        ),
        gapH16,
        paginationControl(),

      ],
    );
  }

  Widget paginationControl() {
    return PaginationControl(
        totalPages: totalPages,
        totalHits: totalHits,
        rowsPerPage: rowsPerPage,
        availableRowsPerPage: availableRowsPerPage,
        onRowsPerPageChanged: onRowsPerPageChanged,
        currentPage: currentPage,
        onPageChanged: onPageChanged,
    );
  }
}
