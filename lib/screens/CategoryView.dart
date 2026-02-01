import 'package:flutter/material.dart';
import 'package:news_app_t/widgets/NewsListView.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.Category});
  final String Category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Adding an AppBar allows users to go back easily
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ), // Consistent padding
        child: CustomScrollView(
          slivers: [
            NewsListView(Category: Category),
          ],
        ),
      ),
    );
  }
}
