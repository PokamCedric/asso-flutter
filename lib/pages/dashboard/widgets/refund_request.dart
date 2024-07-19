import 'package:core_dashboard/pages/card_layout.dart';
import 'package:core_dashboard/shared/constants/defaults.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RefundRequest extends StatelessWidget {
  const RefundRequest({
    super.key,
    required this.newRefund,
    required this.totalRefund,
  });

  final int totalRefund, newRefund;

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      paddingFactor: 0.75,
      child: Column(
        children: [
          gapH8,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: SectionTitle(
              title: "Refund requests",
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          gapH24,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).splashColor,
                  child: SvgPicture.asset(
                    'assets/icons/basket_light.svg',
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).errorColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                gapW8,
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "You have ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "$totalRefund open refund requests",
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: " to action. This includes ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "$newRefund new requests.",
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: " 👀",
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          gapH24,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Center(
                child: Text(
                  "Review refund requests",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          gapH8,
        ],
      ),
    );
  }
}
