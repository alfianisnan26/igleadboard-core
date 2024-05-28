import 'package:igleadboard_core/internal/service/unpacker/comments.dart';
import 'package:igleadboard_core/internal/service/unpacker/content.dart';
import 'package:igleadboard_core/internal/service/unpacker/file_structure.dart';
import 'package:igleadboard_core/internal/service/unpacker/likes.dart';
import 'package:igleadboard_core/internal/service/unpacker/messages.dart';
import 'package:igleadboard_core/internal/service/unpacker/saved.dart';

class InstagramActivity extends FileStructure{
  InstagramActivity(FileStructure fs): super(fs: fs);

  Comments get comments => Comments(pass("comments"));
  Content get content => Content(pass("content"));
  Likes get likes => Likes(pass("likes"));
  MessageGroup get messages => MessageGroup(pass("messages"));
  Saved get saved => Saved(pass("saved"));
}