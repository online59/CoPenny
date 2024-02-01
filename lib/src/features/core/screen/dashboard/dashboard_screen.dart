import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/latest_news_widget.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/top_news_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with AutomaticKeepAliveClientMixin{
  final PageController _pageController = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Top News',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(
            height: 250,
            child: TopNewsWidget(pageController: _pageController),
          ),
          const SizedBox(height: mVSpacingSmall,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Latest News',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const LatestNewsWidget(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
