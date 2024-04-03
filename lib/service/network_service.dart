import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'package:newsapp/model/news_response.dart';

class NetworkService {
  final String apiKey = "d4bb802cd5434447a51f0477f58e5e22";
  final String country = "us";
  static final NetworkService _networkService = NetworkService._internal();

  factory NetworkService() {
    return _networkService;
  }

  NetworkService._internal();

  final _dio = Dio();

  Future<NewsResponse?> searchNews(String query) async {
    try {
      var response = await _dio.get(
          "https://newsapi.org/v2/everything?from=2023-11-07&sortBy=popularity&apiKey=d4bb802cd5434447a51f0477f58e5e22",
          queryParameters: {
            "apiKey": apiKey,
            "q": query,
            "from": DateFormat('yyyy-MM-dd')
              ..format(DateTime.now().add(const Duration(days: -1))),
          });
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<NewsResponse?> getNews() async {
    try {
      var response = await _dio
          .get("https://newsapi.org/v2/top-headlines", queryParameters: {
        "apiKey": apiKey,
        "country": country,
      });
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
