
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class NewsLoadingWidget extends StatelessWidget {
  const NewsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
              child: Container(
                height: 80,
                color: Colors.grey.shade300,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 80,
                          width: 80,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.white),
        );
      },
    );
  }
}
