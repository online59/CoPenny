import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        SliverToBoxAdapter(
          child: SizedBox(
            height: size.height * 0.4,
            child: TopNewsWidget(pageController: _pageController),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(mPaddingSmall),
          sliver: SliverToBoxAdapter(
            child: Text(
              mHotNews,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        SliverFillRemaining(
          child: FutureBuilder<List<News>>(
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

                return SliverPadding(
                  padding: const EdgeInsets.all(mPaddingSmall),
                  sliver: SliverGrid(
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
                          publishedDate: displayNewsList[index].publishedAt ??
                              DateTime.now(),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(mPaddingSmall),
          sliver: Text(
            mLatestNews,
            style: Theme.of(context).textTheme.headlineSmall,
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
