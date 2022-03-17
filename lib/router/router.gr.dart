// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:elibrary/ui/book_detail.dart' as _i1;
import 'package:elibrary/ui/dashboard.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

class FlutterRouter extends _i3.RootStackRouter {
  FlutterRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    BookDetailRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.BookDetail());
    },
    DashboardRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.Dashboard());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(BookDetailRoute.name, path: '/book-detail'),
        _i3.RouteConfig(DashboardRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.BookDetail]
class BookDetailRoute extends _i3.PageRouteInfo<void> {
  const BookDetailRoute() : super(BookDetailRoute.name, path: '/book-detail');

  static const String name = 'BookDetailRoute';
}

/// generated route for
/// [_i2.Dashboard]
class DashboardRoute extends _i3.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '/');

  static const String name = 'DashboardRoute';
}
