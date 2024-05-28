class Reaction {
  final String value;
  final String actor;

  Reaction({required this.value, required this.actor});
}

class Message {
  final String senderName;
  final DateTime ts;
  final String content;
  final String shareLink;
  final List<Reaction> reactions;

  Message({required this.senderName, required this.ts, required this.content, required this.shareLink, required this.reactions});

  @override
  String toString() {
    return "$senderName: $content";
  }
}