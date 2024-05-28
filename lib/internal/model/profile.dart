class Profile {
  final String photoUri;
  final DateTime createdAt;
  final String email;
  final String username;
  final String name;
  final String bio;
  final String gender;
  final String dob;
  final bool isPrivateAccount;

  Profile(
      {required this.photoUri,
      required this.createdAt,
      required this.email,
      required this.username,
      required this.name,
      required this.bio,
      required this.gender,
      required this.dob,
      required this.isPrivateAccount});
}
