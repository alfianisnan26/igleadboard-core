class MessageScore {
  String chatId;
  int count = 0;
  int charCount = 0;

  MessageScore(this.chatId);

  @override
  String toString() {
    return "$chatId: $count ($charCount)";
  }
}