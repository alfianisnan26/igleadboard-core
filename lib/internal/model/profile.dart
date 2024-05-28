import 'dart:ffi';

import 'package:igleadboard_core/internal/model/user.dart';

class Profile extends User{
  final String photoUri;
  final String email;
  final String name;
  final String bio;
  final String gender;
  final DateTime dob;
  final bool isPrivateAccount;

  Profile(
      {required this.photoUri,
      required this.email,
      required super.username,
      required this.name,
      required this.bio,
      required this.gender,
      required this.dob,
      required this.isPrivateAccount,
      required super.href,
      required super.ts,
      });
}
