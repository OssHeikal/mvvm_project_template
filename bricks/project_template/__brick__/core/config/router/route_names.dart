import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes extends AppRoute {
  AppRoutes(super.name, super.path);

  static const splash = AppRoute('splash', '/');
}

class AppRoute {
  final String name;
  final String path;

  const AppRoute(this.name, this.path);

  Future<T?> push<T extends Object?>(
    BuildContext context, {
    Object? extra,
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queries = const <String, dynamic>{},
  }) {
    return context.pushNamed(name, extra: extra, queryParameters: queries, pathParameters: params);
  }

  void pushReplacement<T extends Object?>(
    BuildContext context, {
    Object? extra,
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queries = const <String, dynamic>{},
  }) {
    context.pushReplacementNamed(name,
        extra: extra, queryParameters: queries, pathParameters: params);
  }

  void go<T extends Object?>(
    BuildContext context, {
    Object? extra,
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queries = const <String, dynamic>{},
  }) {
    return context.goNamed(name, extra: extra, queryParameters: queries, pathParameters: params);
  }
}
