import 'package:anthem_assistant/models/twitter/tweet.dart';

class TweetList {
  final List<Tweet> tweets;

  TweetList({
    this.tweets,
  });

  factory TweetList.fromJson(List<dynamic> json) {
    List<Tweet> tweets = new List<Tweet>();
    tweets = json.map((t) => Tweet.fromJson(t)).toList();

    // Used to get the data of the first tweet for research purposes.
    // (json.first as Map<String, dynamic>).keys.forEach((k) => print("$k: ${(json.first as Map<String, dynamic>)[k]}"));

    return new TweetList(
      tweets: tweets,
    );
  }
}