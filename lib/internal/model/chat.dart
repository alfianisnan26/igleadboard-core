import 'package:igleadboard_core/internal/model/message.dart';
import 'package:igleadboard_core/internal/model/user.dart';

class Chat {
  final String id;
  final Map<String, User> participantMapping;
  final List<Message> messages;
  final String title;
  final bool isStillParticipant;
  final String threadPath;

  Chat({required this.id,required this.participantMapping, required this.messages, required this.title, required this.isStillParticipant, required this.threadPath});

  @override
  String toString() {
    return id;
  }
}