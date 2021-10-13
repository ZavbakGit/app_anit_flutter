// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../features/catalog/catalog_view.dart' as _i3;
import '../features/test_start/second_page_view.dart' as _i2;
import '../features/test_start/test_page_view.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    TestRouterView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.TestPageView());
    },
    SecondRouterView.name: (routeData) {
      final args = routeData.argsAs<SecondRouterViewArgs>(
          orElse: () => const SecondRouterViewArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SecondPageView(key: args.key));
    },
    CatalogView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.CatalogView());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(TestRouterView.name, path: '/'),
        _i4.RouteConfig(SecondRouterView.name, path: '/second-page-view'),
        _i4.RouteConfig(CatalogView.name, path: '/catalog-view')
      ];
}

/// generated route for [_i1.TestPageView]
class TestRouterView extends _i4.PageRouteInfo<void> {
  const TestRouterView() : super(name, path: '/');

  static const String name = 'TestRouterView';
}

/// generated route for [_i2.SecondPageView]
class SecondRouterView extends _i4.PageRouteInfo<SecondRouterViewArgs> {
  SecondRouterView({_i5.Key? key})
      : super(name,
            path: '/second-page-view', args: SecondRouterViewArgs(key: key));

  static const String name = 'SecondRouterView';
}

class SecondRouterViewArgs {
  const SecondRouterViewArgs({this.key});

  final _i5.Key? key;
}

/// generated route for [_i3.CatalogView]
class CatalogView extends _i4.PageRouteInfo<void> {
  const CatalogView() : super(name, path: '/catalog-view');

  static const String name = 'CatalogView';
}
