import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/widgets/section_title.dart';
import 'package:flutter/material.dart';

import 'popular_product_item.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      paddingFactor: 0.75,
      child: Column(
        children: [
          gapH8,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.75,
            ),
            child: SectionTitle(
              title: "Popular products",
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Products', style: Theme.of(context).textTheme.labelSmall),
                Text('Earning', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
          gapH8,
          const Divider(),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return PopularProductItem(
                name: 'Crypter - NFT UI kit',
                price: '\$2,453.80',
                imageSrc:
                    'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                isActive: index % 2 == 0,
                onPressed: () {},
              );
            },
          ),
          gapH16,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "All products",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          gapH8,
        ],
      ),
    );
  }
}
