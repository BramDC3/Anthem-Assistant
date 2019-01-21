class Tweet {

  final String id;
  final String text;

  Tweet({
    this.id,
    this.text
  });

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return new Tweet(
      id: json['id_str'],
      text: json['full_text'],
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

    tweets = json.map((t)=>Tweet.fromJson(t)).toList();

    return new TweetList(
       tweets: tweets,
    );
  }

}
