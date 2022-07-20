import 'package:bloc_apis/api_service/api_service.dart';

import '../models/news_response.dart';

class ApiRepository {
   final apiProvider= ApiProvider();
   Future<NewsResponse?> getNews(){
   return apiProvider.getNews();
   }

}