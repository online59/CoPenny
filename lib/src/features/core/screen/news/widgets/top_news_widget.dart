import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/features/core/screen/news/services/news_service.dart';
import 'package:piggy/src/features/core/screen/news/widgets/top_news_item_widget.dart';
import 'package:piggy/src/features/core/screen/news_details/news_details_screen.dart';

class TopNewsWidget extends StatelessWidget {
  const TopNewsWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsService.fetchTopNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
              child: Center(child: Text('Error loading top news')));
        } else {
          List<News> topNewsList = snapshot.data ?? [];

          // Filter out items with empty or null urlToImage property
          topNewsList = topNewsList
              .where((news) =>
                  news.urlToImage != null && news.urlToImage!.isNotEmpty)
              .toList();

          final displayNewsList = topNewsList;

          var pageScrollBehavior = const PageScrollPhysics();
          pageScrollBehavior.dragStartDistanceMotionThreshold;

          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: PageView.builder(
                controller: _pageController,
                itemCount: displayNewsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle news item tap
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(news: displayNewsList[index]),
                        ),
                      );
                    },
                    child: TopNewsCardWidget(
                      news: displayNewsList[index],
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
