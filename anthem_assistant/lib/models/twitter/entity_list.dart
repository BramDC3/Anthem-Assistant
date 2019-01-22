import 'package:anthem_assistant/models/twitter/hashtag_list.dart';

class EntityList {
  final HashTagList hashtagList;

  EntityList({
    this.hashtagList,
  });

  factory EntityList.fromJson(Map<String, dynamic> json) {
    return new EntityList(
      hashtagList: HashTagList.fromJson(json['hashtags']),
    );
  }
}