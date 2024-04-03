import 'package:flutter/material.dart';
import 'package:newsapp/model/news_response.dart';
import 'package:newsapp/service/network_service.dart';
import 'package:newsapp/widgets/news_item_widget.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  TextEditingController textEditingController = TextEditingController();
  NewsResponse? newsResponse;
  NetworkService networkService = NetworkService();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    searchNews(textEditingController.text);
                  },
                  icon: const Icon(Icons.search))),
        ),
        Expanded(child: getBody()),
      ],
    );
  }

  Widget getBody() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
        ],
      );
    } else {
      if (newsResponse != null) {
        return RefreshIndicator(
          onRefresh: () async {
            searchNews(textEditingController.text);
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

  void searchNews(String text) {
    setState(() {
      _isLoading = true;
    });
    networkService.searchNews(text).then((value) {
      setState(() {
        if (value != null) {
          newsResponse = value;
        }
        _isLoading = false;
      });
    });
  }
}
