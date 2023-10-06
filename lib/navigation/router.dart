import 'package:auto_route/auto_route.dart';
import 'package:website/pages/home/home_wrapper.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Wrapper,Route',
)
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      initial: true,
      path: '/',
      page: HomeRoute.page,
    ),
  ];
}
