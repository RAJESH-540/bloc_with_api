// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/dashboard.dart' as _i1;
import '../screens/details_news.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DashBoard.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashBoard());
    },
    DetailsNews.name: (routeData) {
      final args = routeData.argsAs<DetailsNewsArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailsNews(
              key: args.key, imgUrl: args.imgUrl, desc: args.desc));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(DashBoard.name, path: '/'),
        _i3.RouteConfig(DetailsNews.name, path: '/details-news')
      ];
}

/// generated route for
/// [_i1.DashBoard]
class DashBoard extends _i3.PageRouteInfo<void> {
  const DashBoard() : super(DashBoard.name, path: '/');

  static const String name = 'DashBoard';
}

/// generated route for
/// [_i2.DetailsNews]
class DetailsNews extends _i3.PageRouteInfo<DetailsNewsArgs> {
  DetailsNews({_i4.Key? key, required String imgUrl, required String desc})
      : super(DetailsNews.name,
            path: '/details-news',
            args: DetailsNewsArgs(key: key, imgUrl: imgUrl, desc: desc));

  static const String name = 'DetailsNews';
}

class DetailsNewsArgs {
  const DetailsNewsArgs({this.key, required this.imgUrl, required this.desc});

  final _i4.Key? key;

  final String imgUrl;

  final String desc;

  @override
  String toString() {
    return 'DetailsNewsArgs{key: $key, imgUrl: $imgUrl, desc: $desc}';
  }
}
