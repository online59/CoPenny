import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/texts/text_gradient_opacity_background_widget.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/dashboard/model/news.dart';

class TopNewsCardWidget extends StatelessWidget {
  const TopNewsCardWidget({
    super.key,
    required this.imageUrl,
    required this.displayNewsList,
    required this.index,
  });

  final String? imageUrl;
  final List<News> displayNewsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: mMarginSmall),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            imageUrl!,
            errorListener: (object) {
              debugPrint('Error loading image: $object');
            },
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(mContainerSmallRadius),
      ),
      child: TextGradientOpacWidget(
        text: displayNewsList[index].title ?? 'Cannot read title',
      ),
    );
  }
}