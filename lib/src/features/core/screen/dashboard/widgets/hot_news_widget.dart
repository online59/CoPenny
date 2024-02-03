import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/dashboard/model/news.dart';
import 'package:piggy/src/features/core/screen/dashboard/services/news_service.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/hot_news_card_widget.dart';

class HotNewsWidget extends StatelessWidget {
  const HotNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: NewsService.fetchHotNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading news'));
        } else {
          List<News> allNewsList = snapshot.data ?? [];

          // Filter out items with empty or null urlToImage property
          allNewsList = allNewsList
              .where((news) =>
          news.urlToImage != null && news.urlToImage!.isNotEmpty)
              .toList();

          final List<News> displayNewsList = allNewsList.sublist(0, 6);

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: displayNewsList.length,
            itemBuilder: (context, index) {
              return HotNewsCard(
                imageUrl: displayNewsList[index].urlToImage ?? '',
                title: displayNewsList[index].title ?? '',
                author: displayNewsList[index].author ?? '',
                publishedDate:
                    displayNewsList[index].publishedAt ?? DateTime.now(),
              );
            },
          );
        }
      },
    );
  }
}
