import 'package:flutter/material.dart';
import 'package:piggy/src/constants/image_strings.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/features/core/screen/news/widgets/network_image_fallback_widget.dart';

class LatestNewsItemWidget extends StatelessWidget {
  const LatestNewsItemWidget({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: news.urlToImage == null
              ? Image.asset(mLoadingScreenImage,
              width: 60, height: 60, fit: BoxFit.cover)
              : networkImageWithFallback(
            fallbackAssetPath: mLoadingScreenImage,
            news.urlToImage!,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          news.title ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          news.source?['name'] ?? '',
          style: Theme.of(context).textTheme.bodySmall,
        ));
  }
}