import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piggy/src/constants/image_strings.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/common_widget/images/network_image_fallback_widget.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.source?['name'] ?? '',
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(mPaddingSmall),
                child: news.urlToImage == null
                    ? Image.asset(
                        mLoadingScreenImage,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                      )
                    : networkImageWithFallback(
                        fallbackAssetPath: mLoadingScreenImage,
                        news.urlToImage!,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                        borderRadius: mContainerSmallRadius,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: mPaddingSmall),
                child: Text(
                  news.title ?? 'No title',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: mPaddingSmall, top: mPaddingSmall),
                child: Text(
                  news.author ?? 'Anonymous',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: mPaddingSmall),
                child: news.publishedAt == null
                    ? const Text('No date')
                    : Text(
                        DateFormat('MMM dd, yyyy')
                            .add_jm()
                            .format(news.publishedAt!),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(mPaddingSmall),
                child: Text(
                  news.content!,
                ),
              ),
              // Add social sharing icons here
              const Padding(
                padding: EdgeInsets.all(mPaddingSmall),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Write a comment...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
