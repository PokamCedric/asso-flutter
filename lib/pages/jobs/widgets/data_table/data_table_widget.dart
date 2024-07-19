import 'package:core_dashboard/pages/jobs/widgets/data_table/colum_config.dart';
import 'package:core_dashboard/pages/jobs/widgets/data_table/pagination_control.dart';
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
        Datatable(
          data: data,
          rowsPerPage: rowsPerPage,
          currentPage: currentPage,
          columns: columns,
        ),
        paginationControl(),
      ],
    );
  }

  Widget paginationControl() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: PaginationControl(
        totalPages: totalPages,
        totalHits: totalHits,
        rowsPerPage: rowsPerPage,
        availableRowsPerPage: availableRowsPerPage,
        onRowsPerPageChanged: onRowsPerPageChanged,
        currentPage: currentPage,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
