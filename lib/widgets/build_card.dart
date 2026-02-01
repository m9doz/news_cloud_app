import 'package:flutter/material.dart';
import 'package:news_app_t/model/CardStyle.dart';
import 'package:news_app_t/screens/CategoryView.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({super.key, required this.cardStyle});

  final CardStyle cardStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(Category: cardStyle.text);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          height: 100,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(cardStyle.image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              cardStyle.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
