import 'package:african_windows/apps/dashboard/pages/widgets/overview.dart';
import 'package:african_windows/apps/dashboard/pages/widgets/product_overview.dart';
import 'package:african_windows/core/pages/layouts/layout.dart';
import 'package:african_windows/core/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/gaps.dart';
import 'widgets/comments.dart';
import 'widgets/get_more_customers.dart';
import 'widgets/popular_products.dart';
import 'widgets/pro_tips.dart';
import 'widgets/refund_request.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!Responsive.isMobile(context)) gapH24,
          Text(
            "Dashboard",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          gapH20,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    const Overview(),
                    gapH16,
                    const ProductOverviews(),
                    gapH16,
                    const ProTips(),
                    gapH16,
                    const GetMoreCustomers(),
                    if (Responsive.isMobile(context))
                      complementPanel(),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context)) gapW16,
              if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: complementPanel(),
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget complementPanel() {
    return const Column(
                    children: [
                      gapH16,
                      PopularProducts(),
                      gapH16,
                      Comments(),
                      gapH16,
                      RefundRequest(newRefund: 8, totalRefund: 52),
                      gapH8,
                    ],
                  );
  }
}
