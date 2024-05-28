import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';

class Media extends FileStructure{
  Media(FileStructure fs): super(fs: fs);

  String posts({String ?sub}) => join("posts", sub);
  String profile({String ?sub}) => join("profile", sub);
  String stories({String ?sub}) => join("stories", sub);
  String recentlyDeleted({String ?sub}) => join("stories", sub);
}