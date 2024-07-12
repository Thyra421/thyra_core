// ignore_for_file: always_specify_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation {
  Navigation._();

  static late GlobalKey<NavigatorState> _navigatorKey;

  static GlobalKey<NavigatorState> setNavigatorKey(
    GlobalKey<NavigatorState> key,
  ) =>
      _navigatorKey = key;

  static Route<T> _buildRoute<T extends Object>(
    Widget child,
  ) =>
      CupertinoPageRoute<T>(builder: (context) => child);

  /// Pushes the given child onto the current [MaterialApp]'s [Navigator].
  static Future<T?> push<T extends Object>(
    Widget child, {
    /// Whether the page should replace the current page or be pushed on top.
    bool replaceOne = false,
    bool replaceAll = false,
  }) {
    assert(
      _navigatorKey.currentState != null,
      'Navigator key must be initialized.',
    );

    if (replaceAll) {
      return _navigatorKey.currentState!
          .pushAndRemoveUntil(_buildRoute<T>(child), (_) => false);
    }

    if (replaceOne) {
      return _navigatorKey.currentState!.pushReplacement(_buildRoute<T>(child));
    }

    return _navigatorKey.currentState!.push(_buildRoute<T>(child));
  }

  static void pop<T extends Object?>([T? result]) =>
      _navigatorKey.currentState!.pop(result);
}
