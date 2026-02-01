import 'package:flutter/material.dart';
import 'package:news_app_t/model/CardStyle.dart';
import 'package:news_app_t/widgets/build_card.dart';

class print_cards extends StatelessWidget {
  const print_cards({
    super.key,
  });

  final List<CardStyle> cards = const [
    CardStyle("assets/business.avif", "business"),
    CardStyle("assets/entertaiment.avif", "entertainment"),
    CardStyle("assets/general.avif", "general"),
    CardStyle("assets/health.avif", "health"),
    CardStyle("assets/sports.avif", "sport"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return BuildCard(
            cardStyle: cards[index],
          );
        },
      ),
    );
  }
}
