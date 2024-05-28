import 'package:igleadboard_core/internal/model/comment.dart';
import 'package:igleadboard_core/internal/model/user.dart';
import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';

class Comments extends FileStructure {
  List<Comment> _getCommentObject(String filename, {String? tagName, String unknownName = "anon"}) {
    final dir = join(filename);

    var json = getJsonContent(dir);
    if (tagName != null) {
      json = json[tagName];
    }

    return (json as List<dynamic>).map((e){
      final smd = e["string_map_data"];
      final mo = smd["Media Owner"];
      var username = "";
      if (mo != null) {
        username = mo["value"];
      } else {
        username = unknownName;
      }
      return Comment(
          value: smd["Comment"]["value"] as String? ?? "",
          owner: User(username: username),
          ts: DateTime.fromMillisecondsSinceEpoch((smd["Time"]["timestamp"] as int) * 1000),
      );
    }).toList(growable: false);
  }

  Comments(FileStructure fs): super(fs: fs);

  List<Comment> reelsComments() => _getCommentObject("reels_comments.json", tagName: "comments_reels_comments");
  List<Comment> postComments({int seq=1}) => _getCommentObject("post_comments_$seq.json", unknownName: "me");
}
