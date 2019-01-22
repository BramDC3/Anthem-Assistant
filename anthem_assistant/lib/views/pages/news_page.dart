import 'package:anthem_assistant/network/twitter_api.dart';
import 'package:anthem_assistant/viewmodels/news_page_viewmodel.dart';
import 'package:anthem_assistant/views/widgets/news_page/tweetcardlist.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsPageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = NewsPageViewModel(api: TwitterApi());
    loadData();
  }

  Future loadData() async {
    await viewModel.fetchTweets();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<NewsPageViewModel>(
      model: viewModel,
      child: TweetCardList(),
    );
  }
}
