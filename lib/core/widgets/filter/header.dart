

import 'package:flutter/material.dart';

class FilterHeader extends StatelessWidget {
  const FilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'SEARCH AGAIN',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
