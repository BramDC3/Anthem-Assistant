import 'package:anthem_assistant/models/twitter/tweet.dart';
import 'package:anthem_assistant/viewmodels/news_page_viewmodel.dart';
import 'package:anthem_assistant/views/widgets/news_page/tweetcard.dart';
import 'package:anthem_assistant/views/widgets/nointernetconnection.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class TweetCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<NewsPageViewModel>(
      builder: (context, child, viewmodel) {
        return FutureBuilder<List<Tweet>>(
          future: viewmodel.tweets,
          builder: (_, AsyncSnapshot<List<Tweet>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Color(0xFFed3e4d),
                    ),
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var tweets = snapshot.data;
                  return ListView.builder(
                    itemCount: tweets == null ? 0 : tweets.length,
                    itemBuilder: (_, int index) {
                      var tweet = tweets[index];
                      return TweetCard(tweet: tweet);
                    },
                  );
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      await viewmodel.fetchTweets();
                    },
                  );
                }
            }
          },
        );
      },
    );
  }
}
