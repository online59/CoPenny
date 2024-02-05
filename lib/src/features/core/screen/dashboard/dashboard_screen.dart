import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/core/screen/dashboard/model/news.dart';
import 'package:piggy/src/features/core/screen/dashboard/services/news_service.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/hot_news_card_widget.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/hot_news_widget.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/latest_news_widget.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/top_news_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageController = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: [
        TopNewsWidget(pageController: _pageController),
        SliverPadding(
          padding: const EdgeInsets.all(mPaddingSmall),
          sliver: SliverToBoxAdapter(
            child: Text(
              mHotNews,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        FutureBuilder<List<News>>(
          future: NewsService.fetchHotNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return const SliverToBoxAdapter(
                  child: Center(child: Text('Error loading news')));
            } else {
              List<News>? allNewsList = snapshot.data;

              if (allNewsList == null || allNewsList.isEmpty) {
                return const SliverToBoxAdapter(
                    child: Center(child: Text('No news available')));
              }

              // Filter out items with empty or null urlToImage property
              allNewsList = allNewsList
                  .where((news) =>
                      news.urlToImage != null && news.urlToImage!.isNotEmpty)
                  .toList();

              final List<News> displayNewsList =
                  allNewsList.sublist(0, allNewsList.length.clamp(0, 6));

              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: mPaddingSmall,
                  mainAxisSpacing: mPaddingSmall,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return HotNewsCard(
                      imageUrl: displayNewsList[index].urlToImage ?? '',
                      title: displayNewsList[index].title ?? '',
                      author: displayNewsList[index].author ?? '',
                      publishedDate:
                          displayNewsList[index].publishedAt ?? DateTime.now(),
                    );
                  },
                  childCount: displayNewsList.length,
                ),
              );
            }
          },
        ),
        SliverPadding(
          padding: const EdgeInsets.all(mPaddingSmall),
          sliver: SliverToBoxAdapter(
            child: Text(
              mLatestNews,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: LatestNewsWidget(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
