import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/features/core/screen/news_details/news_details_screen.dart'; // Import the intl package for date formatting

class HotNewsCard extends StatelessWidget {
  const HotNewsCard({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizedBoxSize = size.width * 0.7;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(news: news),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            margin: const EdgeInsets.all(mMarginSmall),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(mContainerSmallRadius),
              child: Image.network(
                news.urlToImage!,
                height: sizedBoxSize * 0.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: mPaddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  DateFormat('MMM dd, yyyy').format(news.publishedAt!),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
