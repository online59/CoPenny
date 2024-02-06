import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/features/core/screen/news/services/news_service.dart';
import 'package:piggy/src/features/core/screen/news/widgets/latest_news_item_widget.dart';
import 'package:piggy/src/features/core/screen/news_details/news_details_screen.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: NewsService.fetchLatestNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
              child: Center(child: Text('Error loading news')));
        } else {
          final allNewsList = snapshot.data ?? [];
          final displayNewsList = allNewsList;

          return SliverList.builder(
            itemCount: displayNewsList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(news: displayNewsList[index]),
                    ),
                  );
                },
                child: LatestNewsItemWidget(
                  news: displayNewsList[index],
                ),
              );
            },
          );
        }
      },
    );
  }
}
