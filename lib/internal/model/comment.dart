import 'package:igleadboard_core/internal/model/user.dart';

class Comment {
  String value;
  User owner;
  DateTime ts;

  Comment({required this.value, required this.owner, required this.ts});

  @override
  String toString() {
    return "$owner: $value";
  }
}