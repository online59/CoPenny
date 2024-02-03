import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
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

    return ListView(
      children: [
        SizedBox(
          height: size.height * 0.4,
          child: TopNewsWidget(pageController: _pageController),
        ),
        const SizedBox(
          height: mVSpacingSmall,
        ),
        Padding(
          padding: const EdgeInsets.all(mPaddingSmall),
          child: Text(
            mHotNews,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const HotNewsWidget(),
        const SizedBox(
          height: mVSpacingSmall,
        ),
        Padding(
          padding: const EdgeInsets.all(mPaddingSmall),
          child: Text(
            mLatestNews,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const LatestNewsWidget(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
