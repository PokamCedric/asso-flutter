import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/widgets/data_table/colum_config.dart';
import 'package:flutter/material.dart';

class Datatable extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final int rowsPerPage;
  final int currentPage;
  final List<ColumnConfig> columns; // List of column configurations

  const Datatable({
    super.key,
    required this.data,
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

    return CardLayout(
      child: DataTable(
          columns: visibleColumns,
          rows: displayedJobs
              .map(
                (job) => DataRow(
                  cells: columns
                      .where((column) => column.isVisible)
                      .map(
                        (column) => DataCell(
                          Text(
                            job[column.propertyName] ?? "",
                            softWrap: true, // Enable text wrapping
                            overflow: TextOverflow.clip, // Clip overflowing text
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
    );
  }
}
