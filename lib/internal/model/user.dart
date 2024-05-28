class User {
  final String href;
  final String username;
  final DateTime ts;

  User({
    required this.href,
    required this.username,
    required this.ts,
  });

  @override
  String toString() {
    return username;
  }

  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }

  @override
  int get hashCode => username.hashCode;
}
