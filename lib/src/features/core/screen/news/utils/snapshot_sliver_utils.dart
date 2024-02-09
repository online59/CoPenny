import 'package:flutter/material.dart';

class SnapshotSliverUtils {
  static Widget? checkConnectionAndError(AsyncSnapshot<List<dynamic>> snapshot,
      {String errorMessage = 'Error loading items'}) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (snapshot.hasError || snapshot.data == null) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(errorMessage),
        ),
      );
    } else if (snapshot.data!.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text('No items available'),
        ),
      );
    }
    return null;
  }

  static List<dynamic> filterNullAndEmpty(
      AsyncSnapshot<List<dynamic>> snapshot) {
    List<dynamic> items = snapshot.data ?? [];
    return items
        .where((item) => item.urlToImage != null && item.urlToImage!.isNotEmpty)
        .toList();
  }
}
