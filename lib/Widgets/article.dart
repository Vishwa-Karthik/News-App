import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.author,
    required this.publishedAt,
    this.onTap,
  });

  final String imageUrl;
  final String title;
  final String description;
  final String author;
  final DateTime publishedAt;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.98,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* image
          Image.network(
            imageUrl,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.7,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 10.0),

          //* title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(title),
          ),

          const SizedBox(height: 15.0),

          //* description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              maxLines: 4,
              description,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 20.0),

          //* author
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(author),
            ),
          ),

          const SizedBox(height: 25.0),

          //* published date
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                publishedAt.toString(),
              ),
            ),
          ),

          const Spacer(),

          //* ReadMore Button
          Positioned(
            left: 25,
            bottom: 25,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white12,
              ),
              onPressed: onTap,
              child: const Text(
                'Read More',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
