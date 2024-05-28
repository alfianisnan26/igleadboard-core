import 'dart:io';
import 'package:archive/archive.dart';
import 'package:igleadboard_core/internal/service/unpacker/connections.dart';
import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';
import 'package:igleadboard_core/internal/service/unpacker/instagram_activity.dart';
import 'package:igleadboard_core/internal/service/unpacker/media.dart';
import 'package:igleadboard_core/internal/service/unpacker/personal_information.dart';

class Data extends FileStructure {
  Data(FileStructure fs): super(fs: fs);
  factory Data.fromFile(File file) {
    final zip = file.readAsBytesSync().buffer.asUint8List();;
    final archive = ZipDecoder().decodeBuffer(InputStream(zip));
    final fs = FileStructure(archive: archive);
    return Data(fs);
  }

  Media get media => Media(pass("media"));
  PersonalInformation get personalInformation => PersonalInformation(pass("personal_information"));
  Connections get connections => Connections(pass("connections"));
  InstagramActivity get instagramActivity => InstagramActivity(pass("your_instagram_activity"));
}