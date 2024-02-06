import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/features/core/screen/news/services/news_service.dart';
import 'package:piggy/src/features/core/screen/news/widgets/hot_news_item_widget.dart';

class HotNewsWidget extends StatelessWidget {
  const HotNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: NewsService.fetchHotNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError || snapshot.data == null) {
          return const SliverToBoxAdapter(
            child: Center(child: Text('Error loading news')),
          );
        } else {
          List<News> allNewsList = snapshot.data!;

          if (allNewsList.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('No news available')),
            );
          }

          allNewsList = allNewsList
              .where((news) => news.urlToImage != null && news.urlToImage!.isNotEmpty)
              .toList();

          final List<News> displayNewsList =
          allNewsList.sublist(0, allNewsList.length.clamp(0, 6));

          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: mPaddingSmall,
              mainAxisSpacing: mPaddingSmall,
              childAspectRatio: 0.75, // Adjust the aspect ratio as needed
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return HotNewsCard(
                  news: displayNewsList[index],
                );
              },
              childCount: displayNewsList.length,
            ),
          );
        }
      },
    );
  }
}
