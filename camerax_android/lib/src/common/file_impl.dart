import 'dart:io';

extension FileX on File {
  String get api => path;
}

extension FileApiX on String {
  File get fileImpl => File(this);
}
