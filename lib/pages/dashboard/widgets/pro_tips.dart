import 'package:core_dashboard/pages/card_layout.dart';
import 'package:core_dashboard/pages/dashboard/widgets/tips_item.dart';
import 'package:core_dashboard/responsive.dart';
import 'package:core_dashboard/shared/constants/defaults.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';

List<TipsItem> proTipsDummyData(BuildContext context)
  => [
  const TipsItem(
    title: 'Early access',
    time: '3 mins read',
    iconSrc: 'assets/icons/schedule_light.svg',
  ),
  TipsItem(
    title: 'Asset use guidelines',
    time: 'Time',
    iconSrc: 'assets/icons/arrow_forward_light.svg',
    backgroundColor: Theme.of(context).splashColor,
  ),
  const TipsItem(
    title: 'Exclusive downloads',
    time: '2 mins read',
    iconSrc: 'assets/icons/design_light.svg',
  ),
  const TipsItem(
    title: 'Behind the scenes',
    time: '3 mins read',
    iconSrc: 'assets/icons/video_recorder_light.svg',
  ),
  const TipsItem(
    title: 'Asset use guidelines',
    time: '1 mins read',
    iconSrc: 'assets/icons/phone_call_incoming_light.svg',
  ),
  const TipsItem(
    title: 'Life & work updates',
    time: '3 mins read',
    iconSrc: 'assets/icons/multiselect_light.svg',
  ),
];

class ProTips extends StatelessWidget {
  const ProTips({super.key});
  @override
  Widget build(BuildContext context) {
    return CardLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH8,
          SectionTitle(
            title: "Pro tips",
            color: Theme.of(context).primaryColorLight,
          ),
          gapH20,
          Text(
            'Need some ideas for the next product?',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          gapH20,
          GridView.builder(
            itemCount: List.from(proTipsDummyData(context)).length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: Responsive.isMobile(context) ? 560 : 410,
              mainAxisExtent: 80,
              crossAxisSpacing: AppDefaults.padding,
              mainAxisSpacing: AppDefaults.padding,
            ),
            itemBuilder: (context, index) => List.from(proTipsDummyData(context))[index],
          ),
        ],
      ),
    );
  }
}
