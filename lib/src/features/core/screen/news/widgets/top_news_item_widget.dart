import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/texts/text_gradient_opacity_background_widget.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';
import 'package:piggy/src/features/core/screen/news_details/news_details_screen.dart';

class TopNewsCardWidget extends StatelessWidget {
  const TopNewsCardWidget({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle news item tap
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(news: news),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: mMarginSmall),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              news.urlToImage!,
              errorListener: (object) {
                debugPrint('Error loading image: $object');
              },
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(mContainerSmallRadius),
        ),
        child: TextGradientOpacWidget(
          text: news.title ?? 'Cannot read title',
        ),
      ),
    );
  }
}