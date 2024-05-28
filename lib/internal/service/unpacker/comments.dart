import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';

class Comments extends FileStructure {
  Comments(FileStructure fs): super(fs: fs);

  String get reelsComments => join("reels_comments.json");

  String postComments({int seq=1}) => join("post_comments_$seq.json");
}
