// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

import '../features/auth/auth_view.dart' as _i1;
import '../features/catalog/catalog_view.dart' as _i4;
import '../features/test_start/second_page_view.dart' as _i3;
import '../features/test_start/test_page_view.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthView());
    },
    TestRouterView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.TestPageView());
    },
    SecondRouterView.name: (routeData) {
      final args = routeData.argsAs<SecondRouterViewArgs>(
          orElse: () => const SecondRouterViewArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SecondPageView(key: args.key));
    },
    CatalogView.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CatalogView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(AuthView.name, path: '/'),
        _i5.RouteConfig(TestRouterView.name, path: '/test-page-view'),
        _i5.RouteConfig(SecondRouterView.name, path: '/second-page-view'),
        _i5.RouteConfig(CatalogView.name, path: '/catalog-view')
      ];
}

/// generated route for [_i1.AuthView]
class AuthView extends _i5.PageRouteInfo<void> {
  const AuthView() : super(name, path: '/');

  static const String name = 'AuthView';
}

/// generated route for [_i2.TestPageView]
class TestRouterView extends _i5.PageRouteInfo<void> {
  const TestRouterView() : super(name, path: '/test-page-view');

  static const String name = 'TestRouterView';
}

/// generated route for [_i3.SecondPageView]
class SecondRouterView extends _i5.PageRouteInfo<SecondRouterViewArgs> {
  SecondRouterView({_i7.Key? key})
      : super(name,
            path: '/second-page-view', args: SecondRouterViewArgs(key: key));

  static const String name = 'SecondRouterView';
}

class SecondRouterViewArgs {
  const SecondRouterViewArgs({this.key});

  final _i7.Key? key;
}

/// generated route for [_i4.CatalogView]
class CatalogView extends _i5.PageRouteInfo<void> {
  const CatalogView() : super(name, path: '/catalog-view');

  static const String name = 'CatalogView';
}
