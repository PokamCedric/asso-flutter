import 'package:flutter/material.dart';
import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/constants/gaps.dart';

class InputFieldLayout extends StatelessWidget {
  final String label;
  final Widget child;

  const InputFieldLayout({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
          ),
          gapH8,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: AppDefaults.decoration,
            child: child,
          ),
          gapH16,
        ],
      ),
    );
  }
}
