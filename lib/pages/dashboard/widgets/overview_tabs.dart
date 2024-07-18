import 'package:flutter/material.dart';

import '../../../shared/constants/defaults.dart';
import '../../../shared/constants/ghaps.dart';
import '../../../shared/widgets/tabs/tab_with_growth.dart';
import 'customers_overview.dart';
import 'revenue_line_chart.dart';

class OverviewTabs extends StatefulWidget {
  const OverviewTabs({
    super.key,
  });

  @override
  State<OverviewTabs> createState() => _OverviewTabsState();
}

class _OverviewTabsState extends State<OverviewTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius:
                const BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
          ),
          child: TabBar(
            controller: _tabController,
            dividerHeight: 0,
            padding: const EdgeInsets.symmetric(
                horizontal: 0, vertical: AppDefaults.padding),
            indicator: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDefaults.borderRadius),
              ),
              color: Theme.of(context).canvasColor,
            ),
            tabs: [
              TabWithGrowth(
                title: "Customers",
                amount: "1,200",
                growthPercentage: "20%",
                iconBgColor: Theme.of(context).cardColor,
              ),
              TabWithGrowth(
                title: "Revenue",
                iconSrc: "assets/icons/activity_light.svg",
                iconBgColor: Theme.of(context).cardColor,
                amount: "\$128K",
                growthPercentage: "2.7%",
                isPositiveGrowth: false,
              ),
            ],
          ),
        ),
        gapH24,
        SizedBox(
          height: 280,
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Center(child: CoustomersOverview()),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDefaults.padding * 1.5,
                  vertical: AppDefaults.padding,
                ),
                child: RevenueLineChart(),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 240,
        //   child: AnimatedCrossFade(
        //     duration: const Duration(seconds: 3),
        //     firstChild: CoustomersOverview(),
        //     secondChild: const RevenueLineChart(),
        //     crossFadeState: _selectedIndex == 0
        //         ? CrossFadeState.showFirst
        //         : CrossFadeState.showSecond,
        //   ),
        // )
      ],
    );
  }
}
