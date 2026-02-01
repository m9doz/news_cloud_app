import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_t/model/artical.dart';
import 'package:news_app_t/service/NewsService.dart';
import 'package:news_app_t/widgets/build_news.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key, required this.Category});
  final String Category;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  // 1. نعرف متغير من نوع Future لنحفظ فيه الطلب
  var future;

  @override
  void initState() {
    super.initState();
    // 2. نقوم بتشغيل الطلب مرة واحدة فقط عند بداية التشغيل
    future = NewsService(dio: Dio()).getTopHeadLines(Category: widget.Category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Artical>>(
      future: future, // نعطيه المهمة التي حفظناها
      builder: (context, snapshot) {
        // الحالة الأولى: البيانات وصلت بنجاح (The Data Arrived)
        if (snapshot.hasData) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: snapshot.data!.length, // نأخذ الطول من الـ snapshot
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  // نمرر البيانات من الـ snapshot
                  child: Bnews(a: snapshot.data![index]),
                );
              },
            ),
          );
        }
        // الحالة الثانية: حدث خطأ (Oops, Error)
        else if (snapshot.hasError) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text("Opps, there was an error, try again later"),
            ),
          );
        }
        // الحالة الثالثة: جاري التحميل (Waiting)
        else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ), // Matches your "Cloud" text,
            ),
          );
        }
      },
    );
  }
}
