import 'package:igleadboard_core/internal/model/chat.dart';
import 'package:igleadboard_core/internal/model/message.dart';
import 'package:igleadboard_core/internal/model/user.dart';
import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';
import 'package:path/path.dart' as path;

class Messages extends FileStructure {
  Messages(FileStructure fs): super(fs: fs);

  List<String> getAvailableChatId() {
    return getSubFiles(excludeFile: true).map((e){
      e = e.replaceFirst(super.toString(), "");
      e = e.replaceAll(path.separator, "");
      return e;
    }).toList(growable: false);
  }

  static String getChatIdByUser(List<String> chatIdCollection, User user) {
    return chatIdCollection.firstWhere((e)=> e.startsWith(user.username), orElse: ()=>"");
  }

  Chat getChatById(String chatId, {int seq = 1}) {
    final dir = join(chatId, "message_$seq.json");
    final json = getJsonContent(dir);

    Map<String, User> participantMapping = {};

    final jsonMessages = json["messages"] as List<dynamic>;
    final messages = jsonMessages.map((e)=>Message(
        senderName: e["sender_name"] as String? ?? "",
        ts: DateTime.fromMillisecondsSinceEpoch(e["timestamp_ms"] as int? ?? 0),
        content: e["content"] as String? ?? "",
        shareLink: (){
          final jsonShare = e["share"];
          if (jsonShare == null) return "";
          return jsonShare["link"];
        }(),
        reactions: (){
          final jsonReactions = e["reactions"] as List<dynamic>?;
          if (jsonReactions == null) {
            return  List<Reaction>.empty(growable: false);;
          }
          return jsonReactions.map((r)=>Reaction(value: e["reaction"] as String? ?? "", actor: e["actor"] as String? ?? "")).toList(growable: false);
        }(),
    )).toList(growable: false);

    return Chat(
        id: chatId,
        participantMapping: participantMapping,
        messages: messages,
        title: json["title"] as String? ?? "",
        isStillParticipant: json["is_still_participant"] as bool? ?? false,
        threadPath: json["thread_path"] as String? ?? "",
    );
  }
}


class MessageGroup extends FileStructure{
  MessageGroup(FileStructure fs): super(fs: fs);

  Messages get inbox => Messages(pass("inbox"));
  Messages get messageRequest => Messages(pass("message_requests"));
}
