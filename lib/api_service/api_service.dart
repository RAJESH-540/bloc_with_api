import 'dart:ffi';

import 'package:bloc_apis/models/news_response.dart';
import 'package:dio/dio.dart';

class ApiProvider{
  String url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=538c4e257eeb4388b6fa1825518e032f";
   final dio = Dio();

  Future<NewsResponse?> getNews() async{
    try {
      Response response = await dio.get(url);
       return NewsResponse.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return null;
  }
}