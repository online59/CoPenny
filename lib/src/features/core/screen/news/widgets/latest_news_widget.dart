import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/features/core/screen/news/services/news_service.dart';
import 'package:piggy/src/features/core/screen/news/utils/snapshot_sliver_utils.dart';
import 'package:piggy/src/features/core/screen/news/widgets/latest_news_item_widget.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: NewsService.fetchLatestNews(),
      builder: (context, snapshot) {
        SnapshotSliverUtils.checkConnectionAndError(snapshot);

        final displayNewsList =
            SnapshotSliverUtils.filterNullAndEmpty(snapshot);

        return SliverList.builder(
          itemCount: displayNewsList.length,
          itemBuilder: (context, index) {
            return LatestNewsItemWidget(
              news: displayNewsList[index],
            );
          },
        );
      },
    );
  }
}
