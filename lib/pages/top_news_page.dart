import 'package:flutter/material.dart';
import 'package:newsapp/model/news_response.dart';
import 'package:newsapp/service/network_service.dart';
import 'package:newsapp/widgets/news_item_widget.dart';
import 'package:newsapp/widgets/news_loading_widget.dart';

class TopNewsPage extends StatefulWidget {
  const TopNewsPage({super.key});

  @override
  State<TopNewsPage> createState() => _TopNewsPageState();
}

class _TopNewsPageState extends State<TopNewsPage> {
  NewsResponse? newsResponse;
  NetworkService networkService = NetworkService();
  bool _isLoading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() {
    setState(() {
      _isLoading = true;
    });
    networkService.getNews().then((value) {
      setState(() {
        if (value != null) {
          newsResponse = value;
        }
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    if (_isLoading) {
      return const NewsLoadingWidget();
    } else {
      if (newsResponse != null) {
        return RefreshIndicator(
          onRefresh: () async {
            getNews();
          },
          child: ListView.builder(
              itemCount: newsResponse?.articles?.length ?? 0,
              itemBuilder: (context, index) {
                return NewsItemWidget(
                  articles: newsResponse?.articles![index],
                );
              }),
        );
      } else {
        return Text("Error");
      }
    }
  }
}
