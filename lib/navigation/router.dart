import 'package:auto_route/auto_route.dart';
import 'package:website/pages/home/home_wrapper.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      initial: true,
      path: '/',
      name: 'HomeRoute',
      page: HomeWrapper,
    ),
  ],
)
class $AppRouter {}
