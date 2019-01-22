import 'package:anthem_assistant/utils/twitter_utils/datetimeutil.dart';

class HashTagList {
  final List<String> hashtags;

  HashTagList({
    this.hashtags,
  });

  factory HashTagList.fromJson(List<dynamic> json) {
    List<String> hashtags = new List<String>();
    hashtags = json
        .map((h) => (h as Map<String, dynamic>)['text'].toString())
        .toList();

    return new HashTagList(
      hashtags: hashtags,
    );
  }
}

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

class Tweet {
  final String id;
  final DateTime createdAt;
  final String text;
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

class TweetList {
  final List<Tweet> tweets;

  TweetList({
    this.tweets,
  });

  factory TweetList.fromJson(List<dynamic> json) {
    List<Tweet> tweets = new List<Tweet>();
    tweets = json.map((t) => Tweet.fromJson(t)).toList();

    return new TweetList(
      tweets: tweets,
    );
  }
}
