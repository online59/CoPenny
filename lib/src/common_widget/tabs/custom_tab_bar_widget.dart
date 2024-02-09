import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget(
      {super.key,
      this.tabController,
      this.isScrollable = false,
      this.tabAlignment,
      this.labelPadding,
      this.indicator,
      required this.tabs});

  final TabController? tabController;
  final bool isScrollable;
  final TabAlignment? tabAlignment;
  final EdgeInsetsGeometry? labelPadding;
  final BoxDecoration? indicator;
  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return tabController == null
        ? DefaultTabController(
            length: tabs.length,
            child: TabBar(
              isScrollable: isScrollable,
              tabAlignment: tabAlignment,
              labelPadding: labelPadding,
              labelColor: Theme.of(context).colorScheme.onPrimary,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(mContainerLargeRadius),
              ),
              tabs: tabs,
            ),
          )
        : TabBar(
            isScrollable: isScrollable,
            controller: tabController,
            tabAlignment: tabAlignment,
            labelPadding: labelPadding,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(mContainerLargeRadius),
            ),
            tabs: tabs,
          );
  }
}
