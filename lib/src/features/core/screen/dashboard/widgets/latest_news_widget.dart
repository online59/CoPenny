import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/dashboard/model/news.dart';
import 'package:piggy/src/features/core/screen/dashboard/services/news_service.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/networm_image_fallback_widget.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
        future: NewsService.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading news'));
          } else {
            final allNewsList = snapshot.data ?? [];
            final displayNewsList = allNewsList.sublist(0, 20);

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: displayNewsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: displayNewsList[index].urlToImage == null
                        ? Image.asset(
                            'assets/images/dashboard_images/load-image-error.jpg',
                            width: 60,
                            height: 60,
                          )
                        : networkImageWithFallback(
                            fallbackAssetPath:
                                'assets/images/dashboard_images/load-image-error.jpg',
                            displayNewsList[index].urlToImage!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                  ),
                  title: Text(displayNewsList[index].title ?? ''),
                  subtitle: Text(displayNewsList[index].source?['name'] ?? ''),
                );
              },
            );
          }
        });
  }
}