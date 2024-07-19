import 'package:core_dashboard/pages/jobs/widgets/data_table/colum_config.dart';
import 'package:core_dashboard/pages/jobs/widgets/data_table/text_cell.dart';
import 'package:flutter/material.dart';

class Datatable extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final double containerWidth;
  final int rowsPerPage;
  final int currentPage;
  final List<ColumnConfig> columns; // List of column configurations

  const Datatable({
    super.key,
    required this.data,
    required this.containerWidth,
    required this.rowsPerPage,
    required this.currentPage,
    required this.columns, // Added list of columns
  });

  @override
  Widget build(BuildContext context) {
    final Color titleColor = Theme.of(context).primaryColor;

    final displayedJobs =
        data.skip((currentPage - 1) * rowsPerPage).take(rowsPerPage).toList();

    // Filter visible columns based on isVisible flag
    List<DataColumn> visibleColumns = columns
        .where((column) => column.isVisible)
        .map((column) => DataColumn(
              label: columnTitle(column.label, titleColor),
            ))
        .toList();

    return SizedBox(
      width: containerWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 10, // Adjust spacing between columns as needed
          columns: visibleColumns,
          rows: displayedJobs
              .map(
                (job) => DataRow(
                  cells: columns
                      .where((column) => column.isVisible)
                      .map(
                        (column) => DataCell(
                          PaddedTextCell(
                            text: job[column.propertyName] ?? "",
                            width: column.width,
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
