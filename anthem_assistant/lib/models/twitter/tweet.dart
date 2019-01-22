import 'package:anthem_assistant/models/twitter/entity_list.dart';
import 'package:anthem_assistant/utils/datetime_util.dart';

class Tweet {
  final String id, text;
  final DateTime createdAt;
  final EntityList entityList;

  Tweet({
    this.id,
    this.text,
    this.createdAt,
    this.entityList,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return new Tweet(
      id: json['id_str'],
      text: json['full_text'],
      createdAt: DateTimeUtil.convertToDateTime(json['created_at']),
      entityList: EntityList.fromJson(json['entities']),
    );
  }
}
