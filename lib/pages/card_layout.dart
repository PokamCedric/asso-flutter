import 'package:flutter/material.dart';
import 'package:african_windows/shared/constants/defaults.dart';

class CardLayout extends StatelessWidget {
  final Widget child;
  final double paddingFactor;

  const CardLayout({super.key, required this.child, this.paddingFactor = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(AppDefaults.borderRadius * paddingFactor)),
      ),
      child: child,
    );
  }
}
