import 'package:african_windows/core/models_views/model_table_header.dart';
import 'package:flutter/material.dart';

class CustomTableWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final List<TableHeader> headers;

  const CustomTableWidget({
    super.key,
    required this.data,
    required this.headers,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          _buildHeaderRow(context),
          const Divider(height: 1),
          ..._buildDataRows(),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context) {
    return Row(
      children: headers.map((header) {
        return _buildHeaderCell(context, header.label, header.flex);
      }).toList(),
    );
  }

  Widget _buildHeaderCell(BuildContext context, String text, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDataRows() {
    return data.map((row) {
      return Column(
        children: [
          Row(
            children: headers.map((header) {
              return _buildDataCell(header.flex, row[header.propertyName]);
            }).toList(),
          ),
          const Divider(height: 1),
        ],
      );
    }).toList();
  }

  Widget _buildDataCell(int flex, dynamic value) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value != null ? value.toString() : '',
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
