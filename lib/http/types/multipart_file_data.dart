import 'dart:io';

class MultipartFileData {
  MultipartFileData({required this.file, required this.name});

  final File file;
  final String name;
}
