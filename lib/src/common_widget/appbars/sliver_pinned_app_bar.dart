import 'package:flutter/material.dart';

class SliverPinnedAppBarWidget extends StatelessWidget {
  const SliverPinnedAppBarWidget({
    super.key,
    required this.expandedHeight,
    this.backgroundColor = Colors.white,
    this.child,
  });

  final double expandedHeight;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight,
      backgroundColor: backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
      ),
    );
  }
}
