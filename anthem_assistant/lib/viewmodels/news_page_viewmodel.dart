import 'dart:async';

import 'package:anthem_assistant/models/twitter/tweet.dart';
import 'package:anthem_assistant/network/twitter_api.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsPageViewModel extends Model {
  Future<List<Tweet>> _tweets;
  Future<List<Tweet>> get tweets => _tweets;
  set tweets(Future<List<Tweet>> value) {
    _tweets = value;
    notifyListeners();
  }

  final TwitterApi api;

  NewsPageViewModel({@required this.api});

  Future<bool> fetchTweets() async {
    tweets = api?.getTweetsFromUser('anthemgame');
    return tweets != null;
  }
}