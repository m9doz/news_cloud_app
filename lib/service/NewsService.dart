import 'package:dio/dio.dart';
import 'package:news_app_t/model/artical.dart';
import 'package:news_app_t/api_key.dart';

class NewsService {
  final Dio dio;

  NewsService({required this.dio});

  Future<List<Artical>> getTopHeadLines({required String Category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&category=$Category',
      );
      Map<String, dynamic> jasonData = response.data;
      List<dynamic> articles = jasonData['articles'];
      List<Artical> articlesmodel = [];

      for (var ar in articles) {
        Artical a = Artical(
          image: ar["urlToImage"],
          subTitle: ar["description"],
          title: ar["title"],
        );
        articlesmodel.add(a);
      }
      return articlesmodel;
    } catch (e) {
      return [];
    }
  }
}
