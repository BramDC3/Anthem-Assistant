import 'package:anthem_assistant/models/twitter/tweet.dart';
import 'package:anthem_assistant/utils/datetime_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TweetCard extends StatelessWidget {
  final Tweet tweet;

  TweetCard({
    this.tweet,
  });

  Widget _getTweetImage() {
    return new AspectRatio(
      aspectRatio: 16 / 9,
      child: tweet.entityList.mediaList.urls.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: tweet.entityList.mediaList.urls.first,
              errorWidget: Image.asset(
                'assets/default_tweet_image.jpg',
                fit: BoxFit.fitWidth,
              ),
              fit: BoxFit.fitWidth,
            )
          : Image.asset(
              'assets/default_tweet_image.jpg',
              fit: BoxFit.fitWidth,
            ),
    );
  }

  Widget _getTweetText() {
    String text = tweet.text.replaceAll("\n\n", " ");
    if (tweet.entityList.mediaList.urls.isNotEmpty) {
      text = text.substring(0, text.lastIndexOf(" "));
    }
    return Text(text);
  }

  Widget _getTweetHashtags() {
    String hashtags = "";
    tweet.entityList.hashtagList.hashtags
        .toSet()
        .forEach((h) => hashtags += "#$h ");
    return Text(hashtags);
  }

  Future _openTweetLink() async {
    var url = "https://twitter.com/anthemgame/status/${tweet.id}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openTweetLink(),
      child: Card(
        elevation: 3,
        child: Column(
          children: <Widget>[
            _getTweetImage(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/anthem_logo_twitter.jpg'),
                            radius: 16,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Anthem Game',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Text(DateTimeUtils.formatDate(tweet.createdAt)),
                    ],
                  ),
                  SizedBox(height: 8),
                  _getTweetText(),
                  SizedBox(height: 8),
                  tweet.entityList.hashtagList.hashtags.isNotEmpty
                      ? _getTweetHashtags()
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
