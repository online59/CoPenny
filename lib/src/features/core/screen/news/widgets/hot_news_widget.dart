
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/features/core/screen/news/services/news_service.dart';
import 'package:piggy/src/features/core/screen/news/utils/snapshot_sliver_utils.dart';
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
        SnapshotSliverUtils.checkConnectionAndError(snapshot);

        final allNewsList = SnapshotSliverUtils.filterNullAndEmpty(snapshot);
        final displayNewsList =
        allNewsList.sublist(0, allNewsList.length.clamp(0, 9));

        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: mPaddingSmall,
            mainAxisSpacing: mPaddingSmall,
            childAspectRatio: 0.9, // Adjust the aspect ratio as needed
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

class CustomGridDelegate extends SliverGridDelegate {

  CustomGridDelegate({required this.dimension});

  // This is the desired height of each row (and width of each square).
  // When there is not enough room, we shrink this to the width of the scroll view.
  final double dimension;
  final int crossAxisCount = 2;


  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    // int count = constraints.crossAxisExtent ~/ dimension;
    int count = crossAxisCount;
    if (count < 1) {
      count = 1; // Always fit at least one regardless.
    }
    final double squareDimension = constraints.crossAxisExtent / count;
    return CustomSliverGridLayout(
      crossAxisCount: count,
      fullRowPeriod:
      3, // Number of rows per block (one of which is the full row).
      dimension: squareDimension,
    );
  }

  @override
  bool shouldRelayout(CustomGridDelegate oldDelegate) {
    return dimension != oldDelegate.dimension;
  }
}

class CustomSliverGridLayout extends SliverGridLayout {
  const CustomSliverGridLayout({required this.crossAxisCount, required this.dimension,
    required this.fullRowPeriod})
      : assert(crossAxisCount > 0),
        assert(fullRowPeriod > 1),
        loopLength = crossAxisCount * (fullRowPeriod - 1) + 1,
        loopHeight = fullRowPeriod * dimension;

  final int crossAxisCount;
  final double dimension;
  final int fullRowPeriod;

  // Computed values.
  final int loopLength;
  final double loopHeight;

  @override
  double computeMaxScrollOffset(int childCount) {
    if (childCount == 0 || dimension == 0) {
      return 0;
    }
    return (childCount ~/ loopLength) * loopHeight +
        ((childCount % loopLength) ~/ crossAxisCount) * dimension;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    final int loop = index ~/ loopLength;
    final int loopIndex = index % loopLength;
    if (loopIndex == loopLength - 1) {
      // Full width case.
      return SliverGridGeometry(
        scrollOffset: (loop + 1) * loopHeight - dimension, // "y"
        crossAxisOffset: 0, // "x"
        mainAxisExtent: dimension, // "height"
        crossAxisExtent: crossAxisCount * dimension, // "width"
      );
    }
    // Square case.
    final int rowIndex = loopIndex ~/ crossAxisCount;
    final int columnIndex = loopIndex % crossAxisCount;
    return SliverGridGeometry(
      scrollOffset: (loop * loopHeight) + (rowIndex * dimension), // "y"
      crossAxisOffset: columnIndex * dimension, // "x"
      mainAxisExtent: dimension, // "height"
      crossAxisExtent: dimension, // "width"
    );
  }

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    final int rows = scrollOffset ~/ dimension;
    final int loops = rows ~/ fullRowPeriod;
    final int extra = rows % fullRowPeriod;
    return loops * loopLength + extra * crossAxisCount;
  }

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    final int rows = scrollOffset ~/ dimension;
    final int loops = rows ~/ fullRowPeriod;
    final int extra = rows % fullRowPeriod;
    final int count = loops * loopLength + extra * crossAxisCount;
    if (extra == fullRowPeriod - 1) {
      return count;
    }
    return count + crossAxisCount - 1;
  }
}
