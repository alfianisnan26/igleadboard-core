import 'dart:io';
import 'dart:math';
import 'package:igleadboard_core/internal/model/score.dart';
import 'package:igleadboard_core/internal/service/leadboard/leadboard.dart';
import 'package:igleadboard_core/internal/service/unpacker/data.dart';
import 'package:path/path.dart' as path;

void printList(List<MessageScore> messageScore, {String title = ""}) {
  if (title.isNotEmpty) {
    print(title);
  }

  int maximumUserId = 0;
  int maximumCountLen = 0;
  int maximumCharCountLen = 0;
  for (var e in messageScore) {
    maximumUserId = max(maximumUserId, e.chatId.length);
    maximumCountLen = max(maximumCountLen, e.count.toString().length);
    maximumCharCountLen = max(maximumCharCountLen, e.charCount.toString().length);
  }

  int i = 0;
  for (var e in messageScore) {
    i++;
    print("${(title.isNotEmpty ? "[$title] " :"")}${"$i.".toString().padLeft(4)} ${e.chatId.padRight(maximumUserId, "_")}${e.count.toString().padLeft(maximumCountLen, "_")} ${"(${e.charCount})".padLeft(maximumCharCountLen + 2)}");
  }
}

void main(){
  const baseDir = "sample";
  // const filename = "instagram-xxx-2024-05-28-IWV4IWiT.zip";
  const filename =  "instagram-xxx-2024-05-27-JblC17nq.zip";

  final data = Data.fromFile(File(path.join(baseDir, filename)));
  final leadBoard = LeadBoard(data);

  final messageScore = leadBoard.getMessageLeadBoard(skipName: ["your_name"]);
  messageScore.sort((a, b) => b.count.compareTo(a.count));
  printList(messageScore, title:  "Most Messages");

  print("");
  messageScore.sort((a, b) => b.charCount.compareTo(a.charCount));
  printList(messageScore, title: "Most Message Character Count");
}