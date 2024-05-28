import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';

class Likes extends FileStructure {
  Likes(FileStructure fs): super(fs: fs);

  String get likedComments => join("liked_comments.json");
  String get likedPosts => join("liked_posts.json");
}