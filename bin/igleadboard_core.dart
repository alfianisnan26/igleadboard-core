import 'dart:io';
import 'package:igleadboard_core/internal/model/profile.dart';
import 'package:igleadboard_core/internal/service/leadboard/leadboard.dart';
import 'package:igleadboard_core/internal/service/unpacker/data.dart';
import 'package:igleadboard_core/internal/service/unpacker/messages.dart';
import 'package:path/path.dart' as path;

void main(){
  const baseDir = "sample";
  const filename = "instagram-dpclsx-2024-05-27-JblC17nq.zip";

  final data = Data.fromFile(File(path.join(baseDir, filename)));
  final leadBoard = LeadBoard(data);

  leadBoard.getMostMessageCount().forEach((e)=>print(e));
}