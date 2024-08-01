import 'package:flutter/material.dart';

class CustomTableWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const CustomTableWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    // Extract headers from the first row of data
    final headers = data.first.keys.toList();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          _buildHeaderRow(context, headers),
          const Divider(height: 1),
          ..._buildDataRows(headers),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context, List<String> headers) {
    return Row(
      children: headers.map((header) => _buildHeaderCell(context, header)).toList(),
    );
  }

  Widget _buildHeaderCell(BuildContext context, String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Theme.of(context).primaryColor,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  List<Widget> _buildDataRows(List<String> headers) {
    return data.map((row) {
      return Column(
        children: [
          Row(
            children: headers.map((header) => _buildDataCell(row[header])).toList(),
          ),
          const Divider(height: 1),
        ],
      );
    }).toList();
  }

  Widget _buildDataCell(dynamic value) {
    return Expanded(
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