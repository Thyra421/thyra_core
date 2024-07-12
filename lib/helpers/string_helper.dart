String initials(String str) {
  final names = str.split(' ');
  final buffer = StringBuffer();

  for (var i = 0; i < 2.clamp(0, names.length); i++) {
    buffer.write(names[i][0]);
  }

  return buffer.toString();
}
