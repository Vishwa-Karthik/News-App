import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import '../Models/News_model.dart';

String apiKey = dotenv.env['apiKey'] ?? '';

class NewsApiService {
  static Future<List> fetchNews() async {
    //* list
    List<News> newsList = [];

    // url
    var url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey";

    // req
    Response responseData = await get(Uri.parse(url));

    if (responseData.statusCode == 200) {
      Map jsonData = jsonDecode(responseData.body);

      for (var item in jsonData['articles']) {
        newsList.add(News.fromJson(item));
        debugPrint(newsList.toList().toString());
      }
      return newsList;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
