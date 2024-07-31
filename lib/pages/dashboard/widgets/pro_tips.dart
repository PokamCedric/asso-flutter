import 'package:african_windows/pages/card_layout.dart';
import 'package:african_windows/pages/dashboard/widgets/tips_item.dart';
import 'package:african_windows/responsive.dart';
import 'package:african_windows/shared/constants/defaults.dart';
import 'package:african_windows/shared/constants/gaps.dart';
import 'package:african_windows/shared/widgets/section_title.dart';
import 'package:african_windows/utils/images.dart';
import 'package:flutter/material.dart';

List<TipsItem> proTipsDummyData(BuildContext context)
  => [
  const TipsItem(
    title: 'Early access',
    time: '3 mins read',
    iconSrc: Images.scheduleLight,
  ),
  TipsItem(
    title: 'Asset use guidelines',
    time: 'Time',
    iconSrc: Images.arrowForwardLight,
    backgroundColor: Theme.of(context).splashColor,
  ),
  const TipsItem(
    title: 'Exclusive downloads',
    time: '2 mins read',
    iconSrc: Images.designLight,
  ),
  const TipsItem(
    title: 'Behind the scenes',
    time: '3 mins read',
    iconSrc: Images.videoRecorderLight,
  ),
  const TipsItem(
    title: 'Asset use guidelines',
    time: '1 mins read',
    iconSrc: Images.phoneCallIncomingLight,
  ),
  const TipsItem(
    title: 'Life & work updates',
    time: '3 mins read',
    iconSrc: Images.multiselectLight,
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
