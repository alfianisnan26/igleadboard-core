import 'package:igleadboard_core/internal/model/profile.dart';

class User {
  String? href;
  DateTime? ts;
  final String username;

  User({
    this.href,
    required this.username,
    this.ts,
  });

  void resolve(List<User> users) {
    final updatedUser = users.firstWhere((e) => e == this, orElse: () => this);
    href = updatedUser.href;
    ts = updatedUser.ts;
  }

  @override
  String toString() {
    return username;
  }

  @override
  bool operator ==(Object other) {
    if (other is Profile && username == "me") {
      return true;
    }

    return hashCode == other.hashCode;
  }

  @override
  int get hashCode => username.hashCode;
}
