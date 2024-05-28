import 'dart:convert';

import 'package:igleadboard_core/internal/model/profile.dart';
import 'dart:async';
import 'dart:io';

class Parser {
  String baseDir;

  Parser(this.baseDir);

  dynamic _readFile(String fileDir) {
    return json.decode(File(fileDir).readAsStringSync());
  }

  void test() {
    print(baseDir);

  }
}