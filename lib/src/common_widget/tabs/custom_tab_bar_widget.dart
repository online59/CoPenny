import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({
    super.key,
    this.tabController,
    this.isScrollable = false,
    this.tabAlignment,
    this.labelPadding,
    this.indicator,
    required this.tabs,
    this.beginColorAlignment = Alignment.topCenter,
    this.endColorAlignment = Alignment.bottomCenter,
    this.beginColor = Colors.blue,
    this.endColor = Colors.blueAccent,
  });

  final TabController? tabController;
  final bool isScrollable;
  final TabAlignment? tabAlignment;
  final EdgeInsetsGeometry? labelPadding;
  final BoxDecoration? indicator;
  final List<Tab> tabs;

  final Color beginColor;
  final Color endColor;
  final Alignment beginColorAlignment;
  final Alignment endColorAlignment;

  @override
  Widget build(BuildContext context) {
    return tabController == null
        ? DefaultTabController(
            length: tabs.length,
            child: TabBar(
              splashFactory: NoSplash.splashFactory,
              isScrollable: isScrollable,
              tabAlignment: tabAlignment,
              labelPadding: labelPadding,
              labelColor: Theme.of(context).colorScheme.onPrimary,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  begin: beginColorAlignment,
                  end: endColorAlignment,
                  colors: [beginColor, endColor],
                ),
                borderRadius: BorderRadius.circular(mContainerLargeRadius),
              ),
              tabs: tabs,
            ),
          )
        : TabBar(
            splashFactory: NoSplash.splashFactory,
            isScrollable: isScrollable,
            controller: tabController,
            tabAlignment: tabAlignment,
            labelPadding: labelPadding,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              gradient: LinearGradient(
                begin: beginColorAlignment,
                end: endColorAlignment,
                colors: [beginColor, endColor],
              ),
              borderRadius: BorderRadius.circular(mContainerLargeRadius),
            ),
            tabs: tabs,
          );
  }
}
