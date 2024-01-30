import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/appbars/sliver_pinned_app_bar.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/dashboard/model/news.dart';
import 'package:piggy/src/features/core/screen/dashboard/services/news_service.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/wallet_balance_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Top News',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
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
                      controller: _pageController,
                      itemCount: displayNewsList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: displayNewsList[index].urlToImage == null
                                  ? Image.asset(
                                      'assets/images/dashboard_images/load-image-error.jpg',
                                      fit: BoxFit.cover,
                                    ).image
                                  : CachedNetworkImageProvider(
                                      displayNewsList[index].urlToImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text('Top News $index'),
                        );
                      },
                    );
                  }
                }),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Latest News',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<List<News>>(
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
                              ? const Icon(Icons.image)
                              : Image.network(
                                  displayNewsList[index].urlToImage!,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        title: Text(displayNewsList[index].title ?? ''),
                        subtitle:
                            Text(displayNewsList[index].source?['name'] ?? ''),
                      );
                    },
                  );
                }
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
