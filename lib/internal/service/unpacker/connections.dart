import 'package:igleadboard_core/internal/model/user.dart';
import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';
import 'package:igleadboard_core/internal/service/unpacker/followers_and_following.dart';

class Connections extends FileStructure{


  Connections(FileStructure fs): super(fs: fs);

  FollowersAndFollowing get followersAndFollowing => FollowersAndFollowing(pass("followers_and_following"));
}