import 'package:african_windows/pages/card_layout.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants/defaults.dart';
import '../../../shared/constants/ghaps.dart';
import '../../../shared/widgets/section_title.dart';
import 'overview_tabs.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      child: Column(
        children: [
          Row(
            children: [
              SectionTitle(
              title: "Overview",
              color: Theme.of(context).primaryColorLight,
            ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppDefaults.borderRadius)),
                  border: Border.all(width: 2, color: Theme.of(context).highlightColor),
                ),
                child: DropdownButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding, vertical: 0),
                  style: Theme.of(context).textTheme.labelLarge,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppDefaults.borderRadius)),
                  underline: const SizedBox(),
                  value: "All time",
                  items: const [
                    DropdownMenuItem(
                      value: "All time",
                      child: Text("All time"),
                    ),
                    DropdownMenuItem(
                      value: "This year",
                      child: Text("This year"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          gapH24,
          const OverviewTabs(),
        ],
      ),
    );
  }
}
