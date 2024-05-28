import 'package:path/path.dart' as p;

class FollowersAndFollowing {
  final String _base;

  String get closeFriends => p.join(_base, "close_friends.json");
  String get following => p.join(_base, "following.json");

  FollowersAndFollowing(this._base);

  String followers({int seq = 1}) => p.join(_base, "followers_$seq.json");
}

class Connections {
  final String _base;

  Connections(this._base);

  FollowersAndFollowing get followersAndFollowing => FollowersAndFollowing(p.join(_base, "followers_and_following"));
}



class Media {
  final String _base;

  Media(this._base);

  String _join(String dir, String? sub) {
    if (sub == null) {
      return p.join(_base, dir);
    }

    return p.join(_base, dir, sub);
  }

  String posts({String ?sub}) => _join("posts", sub);

  String profile({String ?sub}) => _join("profile", sub);

  String stories({String ?sub}) => _join("stories", sub);

  String recentlyDeleted({String ?sub}) => _join("stories", sub);
}

class PersonalInformation {
  final String _base;

  PersonalInformation(this._base);
}

class FileStructure {
  final String _base;

  FileStructure(this._base);
}