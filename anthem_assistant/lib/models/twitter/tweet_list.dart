import 'package:anthem_assistant/models/twitter/tweet.dart';

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