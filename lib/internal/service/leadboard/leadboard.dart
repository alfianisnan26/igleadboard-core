import 'package:igleadboard_core/internal/model/score.dart';
import 'package:igleadboard_core/internal/service/unpacker/data.dart';
import 'package:igleadboard_core/internal/service/unpacker/messages.dart';

//  - Likes
//        - Posts Likes/Reaction
//        - Posts Speed React (average)
//        - Stories Likes/Reaction
//        - Stories Speed React (average)
//        - Messages Likes/Reaction
//        - Speed React (Posts + Stories) (average)
//        - Likers (Posts + Stories + Messages)
//        - Best Likers (Scoring: Speed React, Likers)
//  - Comment
//        - Posts Comments (count)
//        - Posts Speed Comments
//        - Stories Comments (count)
//        - Stories Speed Comments
//        - Best Commenter (Scoring: Posts Comment, Posts Speed, Stories Comment, Stories Speed)
//  - Message
//        - Stories Replies count
//        - Message count (minus stories replies)
//        - Character count
//        - Speed Replies (average)
//        - Best Messenger (Scoring: Stories Replies count, Message count, Character count, Speed Replies)
//  - Hall of fame (Best Likers, Best Commenter, Best Messenger)
//        - Monthy (Top 5, Top 50%)
//        - All Times (Top 5, Top 50%)



class LeadBoard {
  final Data _data;
  LeadBoard(this._data);

  List<MessageScore> getMessageLeadBoard({List<String>? skipName}) {

    final inbox = _data.instagramActivity.messages.inbox;
    final chatIds = inbox.getAvailableChatId();

    Map<String, MessageScore> messageScoreMap = {};

    for (final chatId in chatIds) {
      final chat = inbox.getChatById(chatId);
      for (final message in chat.messages) {
        if (skipName != null && skipName.contains(message.senderName)) continue;

        final score = messageScoreMap.putIfAbsent(chatId, ()=>MessageScore(chatId));
        score.count++;
        score.charCount += message.content.length;
      }
    }
    return messageScoreMap.values.toList(growable: false);
  }
}