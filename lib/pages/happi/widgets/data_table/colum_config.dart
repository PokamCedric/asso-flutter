// Model class to represent a column configuration
import 'package:flutter/material.dart';

class ColumnConfig {
  final String label;
  final String propertyName; // Property name in the job map
  final bool isVisible; // Visibility flag
  final double width;

  ColumnConfig({
    required this.label,
    required this.propertyName,
    this.isVisible = true, // Default visibility to true
    this.width = 100.0, // Default visibility to true
  });
}

// Helper function to create column titles with specified color
Widget columnTitle(String title, Color color) {
  return Text(
    title,
    softWrap: false,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(color: color, fontWeight: FontWeight.bold),
  );
}
