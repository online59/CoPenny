import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/features/core/screen/news/services/news_service.dart';
import 'package:piggy/src/features/core/screen/news/utils/snapshot_sliver_utils.dart';
import 'package:piggy/src/features/core/screen/news/widgets/hot_news_item_widget.dart';
import 'package:piggy/src/features/core/screen/news_details/news_details_screen.dart';

class HotNewsWidget extends StatelessWidget {
  const HotNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: NewsService.fetchHotNews(),
      builder: (context, snapshot) {
        SnapshotSliverUtils.checkConnectionAndError(snapshot);

        final allNewsList = SnapshotSliverUtils.filterNullAndEmpty(snapshot);
        final displayNewsList =
            allNewsList.sublist(0, allNewsList.length.clamp(0, 6));

        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: mPaddingSmall,
            mainAxisSpacing: mPaddingSmall,
            childAspectRatio: 0.70, // Adjust the aspect ratio as needed
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
      },
    );
  }
}
