// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../features/auth/auth_view.dart' as _i2;
import '../features/auth_new/auth_new_view.dart' as _i1;
import '../features/catalog/catalog_view.dart' as _i5;
import '../features/test_start/second_page_view.dart' as _i4;
import '../features/test_start/test_page_view.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthNewView.name: (routeData) {
      final args = routeData.argsAs<AuthNewViewArgs>(
          orElse: () => const AuthNewViewArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.AuthNewView(key: args.key));
    },
    AuthView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AuthView());
    },
    TestRouterView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.TestPageView());
    },
    SecondRouterView.name: (routeData) {
      final args = routeData.argsAs<SecondRouterViewArgs>(
          orElse: () => const SecondRouterViewArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.SecondPageView(key: args.key));
    },
    CatalogView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CatalogView());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(AuthNewView.name, path: '/'),
        _i6.RouteConfig(AuthView.name, path: '/auth-view'),
        _i6.RouteConfig(TestRouterView.name, path: '/test-page-view'),
        _i6.RouteConfig(SecondRouterView.name, path: '/second-page-view'),
        _i6.RouteConfig(CatalogView.name, path: '/catalog-view')
      ];
}

/// generated route for [_i1.AuthNewView]
class AuthNewView extends _i6.PageRouteInfo<AuthNewViewArgs> {
  AuthNewView({_i7.Key? key})
      : super(name, path: '/', args: AuthNewViewArgs(key: key));

  static const String name = 'AuthNewView';
}

class AuthNewViewArgs {
  const AuthNewViewArgs({this.key});

  final _i7.Key? key;
}

/// generated route for [_i2.AuthView]
class AuthView extends _i6.PageRouteInfo<void> {
  const AuthView() : super(name, path: '/auth-view');

  static const String name = 'AuthView';
}

/// generated route for [_i3.TestPageView]
class TestRouterView extends _i6.PageRouteInfo<void> {
  const TestRouterView() : super(name, path: '/test-page-view');

  static const String name = 'TestRouterView';
}

/// generated route for [_i4.SecondPageView]
class SecondRouterView extends _i6.PageRouteInfo<SecondRouterViewArgs> {
  SecondRouterView({_i7.Key? key})
      : super(name,
            path: '/second-page-view', args: SecondRouterViewArgs(key: key));

  static const String name = 'SecondRouterView';
}

class SecondRouterViewArgs {
  const SecondRouterViewArgs({this.key});

  final _i7.Key? key;
}

/// generated route for [_i5.CatalogView]
class CatalogView extends _i6.PageRouteInfo<void> {
  const CatalogView() : super(name, path: '/catalog-view');

  static const String name = 'CatalogView';
}
