import 'package:app_anit_flutter/presenter/features/catalog/catalog_view.dart';
import 'package:app_anit_flutter/presenter/features/test_start/second_page_view.dart';
import 'package:app_anit_flutter/presenter/features/test_start/test_page_view.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Router',
  routes: <AutoRoute>[
    AutoRoute(page: TestPageView, initial: true),
    AutoRoute(page: SecondPageView),
    AutoRoute(page: CatalogView),
  ],
)
class $AppRouter {}

