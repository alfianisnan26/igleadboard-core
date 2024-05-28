import 'dart:io';
import 'package:igleadboard_core/internal/model/profile.dart';
import 'package:igleadboard_core/internal/service/unpacker/data.dart';
import 'package:igleadboard_core/internal/service/unpacker/messages.dart';
import 'package:path/path.dart' as path;

void main(){
  const baseDir = "sample";
  const filename = "instagram-dpclsx-2024-05-27-JblC17nq.zip";

  final data = Data.fromFile(File(path.join(baseDir, filename)));
  // Profile profile = data.personalInformation.personalInformation();
  // print(profile.username);
  // data.connections.followersAndFollowing.restrictedAccounts().forEach((e) => print(e));
  // data.instagramActivity.comments.postComments().forEach((e) => print(e));

  final fav = data.connections.followersAndFollowing.accountsYouveFavorited().first;
  final chatIds = data.instagramActivity.messages.inbox.getAvailableChatId();
  final chatId = Messages.getChatIdByUser(chatIds, fav);
  final chat = data.instagramActivity.messages.inbox.getChatById(chatId);
  for (var e in chat.messages) {
    print(e);
  }
}