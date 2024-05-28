import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';

class Content extends FileStructure{
  Content(FileStructure fs): super(fs: fs);

  String get profilePhotos => join("profile_photos.json");
  String get recentlyDeletedContent => join("recently_deleted_content.json");
  String get stories => join("stories");

  String posts({int seq=1}) =>  join("posts_$seq.json");
}