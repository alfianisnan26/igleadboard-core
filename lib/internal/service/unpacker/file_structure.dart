import 'dart:convert';

import 'package:path/path.dart' as path;
import 'package:archive/archive.dart';

class FileStructure {
  late final String _base;
  late final Archive _archive;

  FileStructure({String base = "", Archive? archive, FileStructure? fs}) {
    if (fs == null) {
      _base = base;
      _archive = archive!;
      return;
    }

    _base = fs._base;
    _archive = fs._archive;
  }

  @override
  String toString() {
    return _base;
  }

  String join(String dir, [String? sub]) {
    if (sub == null) {
      return path.join(_base, dir);
    }

    return path.join(_base, dir, sub);
  }

  String getFileContent(String path) {
    final file = _archive.findFile(path);
    if (file == null) {
      return "";
    }

    return utf8.decode(file.content);
  }

  dynamic getJsonContent(String path) {
    final content = getFileContent(path);
    if (content.isEmpty) {
      return null;
    }
    return jsonDecode(content);
  }

  FileStructure pass(String dir) {
    return FileStructure(base: join(dir), archive: _archive);
  }


}



















