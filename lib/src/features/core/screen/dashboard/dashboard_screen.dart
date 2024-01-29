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
  List<String> newsList = List.generate(7, (index) => 'News Title $index');
  bool isLoading = false;


  void loadMoreNews() {
    setState(() {
      isLoading = true;
    });

    // Simulated delay to mimic loading from network
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        newsList.addAll(List.generate(5, (index) => 'News Title ${index + newsList.length}'));
        isLoading = false;
      });
    });
  }

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
            child: PageView.builder(
              controller: _pageController,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text('Top News $index'),
                );
              },
            ),
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
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading news'));
              } else {
                final newsList = snapshot.data ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://via.placeholder.com/50',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(newsList[index].title),
                      subtitle: Text('Published Date $index'),
                    );
                  },
                );
              }
            }
          ),
          const SizedBox(height: 20,),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (newsList.length < 20)
            Center(
              child: ElevatedButton(
                onPressed: loadMoreNews,
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text('Read more'),
                ),
              ),
            ),
          const SizedBox(height: 50,)
        ],
      ),
    );
  }
}
