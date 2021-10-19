import 'package:app_anit_flutter/presenter/features/auth/auth_view.dart';
import 'package:app_anit_flutter/presenter/features/auth_new/auth_new_view.dart';
import 'package:app_anit_flutter/presenter/features/catalog/catalog_view.dart';
import 'package:app_anit_flutter/presenter/features/test_start/second_page_view.dart';
import 'package:app_anit_flutter/presenter/features/test_start/test_page_view.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Router',
  routes: <AutoRoute>[
    AutoRoute(page: AuthNewView, initial: true),
    AutoRoute(page: AuthView),
    AutoRoute(page: TestPageView),
    AutoRoute(page: SecondPageView),
    AutoRoute(page: CatalogView),
  ],
)
class $AppRouter {}

//flutter pub run build_runner build
//flutter pub run build_runner --delete-conflicting-outputs
