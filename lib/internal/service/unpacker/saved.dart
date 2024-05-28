import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';

class Saved extends FileStructure{
  Saved(FileStructure fs) : super(fs: fs);

  String get savedCollections => join("saved_collections.json");
  String get savedPosts => join("saved_posts.json");
}