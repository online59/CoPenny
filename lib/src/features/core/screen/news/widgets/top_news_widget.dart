import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/news/services/news_service.dart';
import 'package:piggy/src/features/core/screen/news/utils/snapshot_sliver_utils.dart';
import 'package:piggy/src/features/core/screen/news/widgets/top_news_item_widget.dart';

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

        SnapshotSliverUtils.checkConnectionAndError(snapshot);

        final displayNewsList = SnapshotSliverUtils.filterNullAndEmpty(snapshot);

        return SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: PageView.builder(
              controller: _pageController,
              itemCount: displayNewsList.length,
              itemBuilder: (context, index) {
                return TopNewsCardWidget(
                  news: displayNewsList[index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
