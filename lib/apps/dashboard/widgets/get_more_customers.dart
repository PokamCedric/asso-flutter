import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/utils/responsive.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/widgets/section_title.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetMoreCustomers extends StatelessWidget {
  const GetMoreCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      child: Column(
        children: [
          SectionTitle(
            title: "Get more customers!",
            color: Theme.of(context).primaryColorLight,
          ),
          gapH20,
          const Text(
            '50% of new customers explore products because the author sharing the work on the social media network. Gain your earnings right now! 🔥',
          ),
          gapH20,
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Images.facebookFilled,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) gapW4,
                      if (!Responsive.isMobile(context))
                        Text(
                          "Facebook",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Images.twitterLight,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) gapW4,
                      if (!Responsive.isMobile(context))
                        Text(
                          "Twitter",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Images.instagramLight,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).hintColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) gapW4,
                      if (!Responsive.isMobile(context))
                        Text(
                          "Instagram",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
