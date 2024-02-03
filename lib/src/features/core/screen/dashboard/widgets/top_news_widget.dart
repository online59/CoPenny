import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/texts/text_gradient_opacity_background_widget.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/dashboard/model/news.dart';
import 'package:piggy/src/features/core/screen/dashboard/services/news_service.dart';

class TopNewsWidget extends StatelessWidget {
  const TopNewsWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsService.fetchTopNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading top news'));
        } else {
          List<News> topNewsList = snapshot.data ?? [];

          // Filter out items with empty or null urlToImage property
          topNewsList = topNewsList
              .where((news) =>
                  news.urlToImage != null && news.urlToImage!.isNotEmpty)
              .toList();

          final displayNewsList = topNewsList;

          return PageView.builder(
            controller: _pageController,
            itemCount: displayNewsList.length,
            itemBuilder: (context, index) {
              final imageUrl = displayNewsList[index].urlToImage;
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
                  borderRadius:
                      BorderRadius.circular(mContainerMediumRadius),
                ),
                child: TextGradientOpacWidget(
                  text: displayNewsList[index].title ?? 'Cannot read title',
                ),
              );
            },
          );
        }
      },
    );
  }
}
