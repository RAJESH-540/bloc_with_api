// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:bloc_apis/screens/dashboard.dart';
import 'package:bloc_apis/screens/details_news.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: DashBoard, initial: true),
    AutoRoute(page: DetailsNews),
  ],
)
class $AppRouter {}