import 'package:igleadboard_core/internal/model/profile.dart';
import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';

class PersonalInformation extends FileStructure{
  PersonalInformation(FileStructure fs): super(fs: fs);

  Profile personalInformation() {
    final json = getJsonContent(join("personal_information", "personal_information.json"));

    final profileUser = (json["profile_user"] as List<dynamic>).first;
    final profilePhoto = profileUser["media_map_data"]["Profile Photo"];
    final smd = profileUser["string_map_data"];
    final username = smd["Username"]["value"] as String? ?? "";
    return Profile(
      ts: DateTime.fromMillisecondsSinceEpoch((profilePhoto["creation_timestamp"] as int? ?? 0)~/ 1000),
      photoUri: profilePhoto["uri"] as String? ?? "",
      email: smd["Email"]["value"] as String? ?? "",
      username: username,
      name: smd["Name"]["value"] as String? ?? "",
      bio: smd["Bio"]["value"] as String? ?? "",
      gender: smd["Gender"]["value"] as String? ?? "",
      dob: DateTime.parse(smd["Date of birth"]["value"] as String? ?? ""),
      isPrivateAccount: (smd["Private Account"]["value"] as String? ?? "False") == "True",
      href: "https://www.instagram.com/$username",
    );
  }
}

