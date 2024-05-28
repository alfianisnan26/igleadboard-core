import 'package:igleadboard_core/internal/model/user.dart';
import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';

class FollowersAndFollowing extends FileStructure{
  List<User> _getUserObject(String filename, [String? tagName]) {
    var json = getJsonContent(join(filename));
    if (tagName != null) {
      print("$filename $tagName");
      json = json[tagName];
    }

    return (json as List<dynamic>).map((e) {
      final sld = (e["string_list_data"] as List<dynamic>).first;
      return User(
        href: sld["href"] as String? ?? "",
        username: sld["value"] as String? ?? "",
        ts: DateTime.fromMillisecondsSinceEpoch((sld["timestamp"] as int? ?? 0) * 1000),
      );
    }).toList(growable: false);
  }

  FollowersAndFollowing(FileStructure fs): super(fs: fs);

  List<User> closeFriends() => _getUserObject("close_friends.json", "relationships_close_friends");
  List<User> accountsYouveFavorited() => _getUserObject("accounts_you've_favorited.json", "relationships_feed_favorites");
  List<User> followers({int seq = 1}) => _getUserObject("followers_$seq.json");
  List<User> following() => _getUserObject("following.json", "relationships_following");
  List<User> pendingFollowRequests() => _getUserObject("pending_follow_requests.json", "relationships_follow_requests_sent");
  List<User> recentFollowRequests() => _getUserObject("recent_follow_requests.json", "relationships_permanent_follow_requests");
  List<User> recentlyUnfollowedAccounts() => _getUserObject("recently_unfollowed_accounts.json","relationships_unfollowed_users");
  List<User> restrictedAccounts() => _getUserObject("restricted_accounts.json", "relationships_restricted_users");
}