import 'package:flutter/material.dart';
import 'package:thyra_core/extensions/build_context_extension.dart';

class Messenger {
  static late GlobalKey<ScaffoldMessengerState> _messengerKey;

  static GlobalKey<ScaffoldMessengerState> setMessengerKey(
    GlobalKey<ScaffoldMessengerState> key,
  ) =>
      _messengerKey = key;

  static void showSnackBarError(String content) {
    assert(
      _messengerKey.currentState != null,
      'Navigator key must be initialized.',
    );

    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.warning_rounded, color: Colors.white),
            ),
            Expanded(
              child: Text(content, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  static void showSnackBarSuccess(String content) {
    assert(
      _messengerKey.currentState != null,
      'Navigator key must be initialized.',
    );

    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.green,
        content: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.check_circle_rounded, color: Colors.white),
            ),
            Expanded(
              child: Text(content, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  static void showSnackBarQuickInfo(String content, BuildContext context) {
    assert(
      _messengerKey.currentState != null,
      'Navigator key must be initialized.',
    );

    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        duration: const Duration(seconds: 1),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.check_circle_rounded, color: Colors.white),
            ),
            Expanded(
              child: Text(
                content,
                style: TextStyle(color: context.theme.colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
