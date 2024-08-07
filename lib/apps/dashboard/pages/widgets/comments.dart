import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/apps/dashboard/pages/widgets/comment_item.dart';
import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/widgets/section_title.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

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
              title: "Comments",
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          gapH16,
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return CommentItem(
                name: 'Jazmyn',
                username: 'jaz.designer',
                time: '1h',
                product: 'Fleet - Travel shopping',
                comment: 'I need react version asap!',
                imageSrc: index == 1
                    ? 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg'
                    : 'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?rs=1&pid=ImgDetMain',
                onProfilePressed: () {},
                onProductPressed: () {},
              );
            },
          ),
          gapH8,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "View all",
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
