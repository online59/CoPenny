import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart'; // Import the intl package for date formatting

class HotNewsCard extends StatefulWidget {
  const HotNewsCard({
    super.key,
    required this.news,
  });

  final News news;


  @override
  State<HotNewsCard> createState() => _HotNewsCardState();
}

class _HotNewsCardState extends State<HotNewsCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizedBoxSize = size.width * 0.7;

    return SizedBox(
      width: sizedBoxSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            margin: const EdgeInsets.all(mMarginSmall),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(mContainerSmallRadius),
              child: Image.network(
                widget.news.urlToImage!,
                height: sizedBoxSize * 0.6,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(mPaddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.news.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  DateFormat('MMM dd, yyyy').format(widget.news.publishedAt!),
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
