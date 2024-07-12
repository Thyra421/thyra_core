String unescapeUnicode(String input) {
  final decoded = input.replaceAllMapped(
    RegExp(r'\\u([0-9a-fA-F]{4})'),
    (match) => String.fromCharCode(int.parse(match.group(1)!, radix: 16)),
  );
  return decoded;
}
