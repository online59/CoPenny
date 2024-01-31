import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/dashboard/services/news_service.dart';

class TopNewsWidget extends StatefulWidget {
  const TopNewsWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  State<TopNewsWidget> createState() => _TopNewsWidgetState();
}

class _TopNewsWidgetState extends State<TopNewsWidget> {

  bool isImageLoadError = false;

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
            final topNewsList = snapshot.data ?? [];
            final displayNewsList = topNewsList.sublist(0, 6);
            return PageView.builder(
              controller: widget._pageController,
              itemCount: displayNewsList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: isImageLoadError
                            ? Image.asset(
                          'assets/images/dashboard_images/load-image-error.jpg',
                          fit: BoxFit.cover,
                        ).image
                            : CachedNetworkImageProvider(
                            displayNewsList[index].urlToImage!),
                        fit: BoxFit.cover,
                        onError: (_, __) {
                          setState(() {
                            isImageLoadError = true;
                          });
                        }
                    ),
                  ),
                  child: Text('Top News $index'),
                );
              },
            );
          }
        });
  }
}