import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';

class Messages extends FileStructure{
  Messages(FileStructure fs): super(fs: fs);

  String inbox({String ?sub}) => join("inbox", sub);
  String messageRequests({String ?sub}) => join("message_requests", sub);
}
