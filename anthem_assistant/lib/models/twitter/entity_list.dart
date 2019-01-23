import 'package:anthem_assistant/models/twitter/hashtag_list.dart';
import 'package:anthem_assistant/models/twitter/media_list.dart';

class EntityList {
  final HashTagList hashtagList;
  final MediaList mediaList;

  EntityList({
    this.hashtagList,
    this.mediaList,
  });

  factory EntityList.fromJson(Map<String, dynamic> json) {
    return new EntityList(
      hashtagList: HashTagList.fromJson(json['hashtags']),
      mediaList: MediaList.fromJson(json['media']),
    );
  }
}