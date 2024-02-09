import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/core/screen/news/widgets/hot_news_widget.dart';
import 'package:piggy/src/features/core/screen/news/widgets/latest_news_widget.dart';
import 'package:piggy/src/features/core/screen/news/widgets/top_news_widget.dart';

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

    return CustomScrollView(
      slivers: [
        TopNewsWidget(pageController: _pageController),
        SliverPadding(
          padding: const EdgeInsets.only(
              left: mPaddingMedium, right: mPaddingMedium, top: mPaddingMedium),
          sliver: SliverToBoxAdapter(
            child: Text(
              mHotNews.toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        const HotNewsWidget(),
        SliverPadding(
          padding: const EdgeInsets.all(mPaddingMedium),
          sliver: SliverToBoxAdapter(
            child: Text(
              mLatestNews.toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        const LatestNewsWidget(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
