import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piggy/src/constants/sizes.dart'; // Import the intl package for date formatting

class HotNewsCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String author;
  final DateTime publishedDate;

  const HotNewsCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.publishedDate,
  }) : super(key: key);

  @override
  State<HotNewsCard> createState() => _HotNewsCardState();
}

class _HotNewsCardState extends State<HotNewsCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizedBoxSize = size.width * 0.6;

    return SizedBox(
      width: sizedBoxSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            margin: const EdgeInsets.all(mMarginSmall),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(mContainerSmallRadius)),
              child: Image.network(
                widget.imageUrl,
                height: sizedBoxSize,
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
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  DateFormat('MMM dd, yyyy').format(widget.publishedDate),
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
