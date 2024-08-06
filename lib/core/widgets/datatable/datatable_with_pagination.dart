import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/models_views/model_table_header.dart';
import 'package:african_windows/core/widgets/datatable/datatable.dart';
import 'package:african_windows/core/widgets/datatable/pagination.dart';
import 'package:flutter/material.dart';

class DataTableWithPagination extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final List<TableHeader> headers;
  final int rowsPerPage;
  final int currentPage;
  final List<int> availableRowsPerPage;
  final void Function(int newPage) onPageChanged;
  final void Function(int? newRowsPerPage) onRowsPerPageChanged;

  const DataTableWithPagination({
    super.key,
    required this.data,
    required this.headers,
    required this.rowsPerPage,
    required this.currentPage,
    required this.availableRowsPerPage,
    required this.onPageChanged,
    required this.onRowsPerPageChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _paginationControl(),
        gapH16,
        CustomDataTable(
          data: data,
          headers: headers,
          rowsPerPage: rowsPerPage,
          currentPage: currentPage,
        ),
        gapH16,
        _paginationControl(),
      ],
    );
  }


  Widget _paginationControl() {

    return Pagination(
        totalHits: data.length,
        rowsPerPage: rowsPerPage,
        currentPage: currentPage,
        availableRowsPerPage: availableRowsPerPage,
        onRowsPerPageChanged: onRowsPerPageChanged,
        onPageChanged: onPageChanged,
    );
  }
}
