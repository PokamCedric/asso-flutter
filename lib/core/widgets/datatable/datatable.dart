import 'package:african_windows/core/models_views/model_table_header.dart';
import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/widgets/datatable/custom_table.dart';
import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final List<TableHeader> headers;
  final int rowsPerPage;
  final int currentPage;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const CustomDataTable({
    super.key,
    required this.data,
    required this.headers,
    required this.rowsPerPage,
    required this.currentPage,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {

    final displayedData =
        data.skip((currentPage - 1) * rowsPerPage).take(rowsPerPage).toList();


    return CardLayout(
      child: CustomTableWidget(
        data: displayedData,
        headers: headers,
        onEdit: onEdit,
        onDelete: onDelete,
        ),
    );
  }
}
