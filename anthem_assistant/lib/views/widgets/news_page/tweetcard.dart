import 'package:anthem_assistant/models/twitter/tweet.dart';
import 'package:flutter/material.dart';

class TweetCard extends StatelessWidget {
  final Tweet tweet;

  TweetCard({
    this.tweet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[Text(tweet.createdAt.toString())],
          ),
          Row(
            children: <Widget>[Text(tweet.text)],
          ),
          Row(
            children: <Widget>[Text(tweet.entityList.hashtagList.hashtags.toSet().toString())],
          ),
        ],
      ),
      elevation: 8,
    );
  }
}
