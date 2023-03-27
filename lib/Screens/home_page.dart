import 'package:flutter/material.dart';
import 'package:news/Screens/detailed_view.dart';
import 'package:news/Widgets/article.dart';

import '../Services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* page controller
  late PageController _pageController;

  @override
  void initState() {
    //* page controller
    _pageController = PageController(initialPage: 0);

    //* fetch news
    NewsApiService.fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: NewsApiService.fetchNews(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //* has data
          if (snapshot.hasData) {
            return PageView.builder(
                onPageChanged: (value) {
                  NewsApiService.fetchNews();
                },
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Article(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedView(
                          url: snapshot.data[index].url,
                        ),
                      ),
                    ),
                    publishedAt: snapshot.data[index].publishedAt,
                    author: snapshot.data[index].author,
                    imageUrl: snapshot.data[index].urlToImage,
                    title: snapshot.data[index].title,
                    description: snapshot.data[index].description,
                  );
                });
          } //* has error
          else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error} occured"));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
