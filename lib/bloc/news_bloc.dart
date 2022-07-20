import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_apis/models/news_response.dart';
import 'package:equatable/equatable.dart';

import '../api_service/api_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiRepository _apiRepository = ApiRepository();
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
       emit(NewsLoadingState());
       final newsList = await _apiRepository.getNews();
        emit(NewsLoadedState(newsList!));
    });
  }
}
