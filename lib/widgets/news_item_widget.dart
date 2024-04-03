
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/news_response.dart';


class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key, required this.articles});

  final Articles? articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: articles?.urlToImage ?? "",
            height: 80,
            width: 80,
            placeholder: (context, url) {
              return const Row(
                children: [
                  CircularProgressIndicator(),
                ],
              );
            },
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    articles?.title ?? '',
                    style: const TextStyle(fontSize: 16),
                    maxLines: 1,
                  ),
                ),
                Text(
                  articles?.description ?? '',
                  style: const TextStyle(fontSize: 12),
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
