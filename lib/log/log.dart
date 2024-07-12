import 'dart:developer';

const String _reset = '\x1B[0m';
const String _black = '\x1B[30m';
const String _white = '\x1B[37m';
const String _red = '\x1B[31m';
const String _green = '\x1B[32m';
const String _yellow = '\x1B[33m';
const String _blue = '\x1B[34m';
const String _cyan = '\x1B[36m';

enum LogColor {
  black(_black),
  white(_white),
  red(_red),
  green(_green),
  yellow(_yellow),
  blue(_blue),
  cyan(_cyan);

  const LogColor(this.color);
  final String color;
}

void consoleLog(Object? object, {LogColor color = LogColor.blue}) {
  log('${color.color}$object$_reset');
}
