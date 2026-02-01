import 'package:flutter/material.dart';
import 'package:news_app_t/widgets/NewsListView.dart';
import 'package:news_app_t/widgets/PrintCards.dart';

class HomeScreen extends StatefulWidget {
  // 1. Converted to StatefulWidget
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            // added const for performance
            Text("News", style: TextStyle(color: Colors.black)),
            Text("Cloud", style: TextStyle(color: Colors.orange)),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, // cleaner look
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RefreshIndicator(
          onRefresh: () async {
            // 2. This triggers the rebuild
            setState(() {});
            // Optional: wait 1 sec to let the user see the loading spin
            await Future.delayed(const Duration(seconds: 1));
          },
          child: CustomScrollView(
            physics:
                const AlwaysScrollableScrollPhysics(), // Ensures scroll always works
            slivers: [
              const SliverToBoxAdapter(
                child: print_cards(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 22),
              ),
              NewsListView(
                // 3. THE MAGIC TRICK:
                // This forces initState to run again by creating a "new" widget
                key: UniqueKey(),
                Category: 'general',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
