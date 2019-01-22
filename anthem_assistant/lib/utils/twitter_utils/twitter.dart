import 'dart:convert';
import 'package:anthem_assistant/utils/twitter_utils/tweet.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';

class Twitter {

  static String generateSignature(String method, String base, List<String> sortedItems) {
    String param = '';

    for (int i = 0; i < sortedItems.length; i++) {
      if (i == 0) param = sortedItems[i];
      else param += '&${sortedItems[i]}';
    }

    String sig = '$method&${Uri.encodeComponent(base)}&${Uri.encodeComponent(param)}';
    String key = '${Uri.encodeComponent("UBILJJERiKBwZ1mUYZX6MLKb8MGkzSGQl9GJyhMdHeqJ4J7mQN")}&${Uri.encodeComponent("EBvEvCitP54kWcadjJvGOOh7uI5ZWAxm9vqmqff7SFgGM")}';
    var digest = Hmac(sha1, utf8.encode(key)).convert(utf8.encode(sig));
    return base64.encode(digest.bytes);
  }

  static Future<http.Response> _twitterGet(String base, List<List<String>> params) async {
    String oauthConsumer = 'oauth_consumer_key="${Uri.encodeComponent("1wcUuos5medaRPb0mMI1jhseh")}"';
    String oauthToken = 'oauth_token="${Uri.encodeComponent("67354697-O0My37xTCMntHfp8tIi5tghjIJ2yeWqXNvvWVVwKC")}"';
    String oauthNonce = 'oauth_nonce="${Uri.encodeComponent(randomAlphaNumeric(42))}"';
    String oauthVersion = 'oauth_version="${Uri.encodeComponent("1.0")}"';
    String oauthTime = 'oauth_timestamp="${(DateTime.now().millisecondsSinceEpoch / 1000).toString()}"';
    String oauthMethod ='oauth_signature_method="${Uri.encodeComponent("HMAC-SHA1")}"';

    var oauthList = [
      oauthConsumer.replaceAll('"', ""),
      oauthNonce.replaceAll('"', ""),
      oauthMethod.replaceAll('"', ""),
      oauthTime.replaceAll('"', ""),
      oauthToken.replaceAll('"', ""),
      oauthVersion.replaceAll('"', "")
    ];

    var paramMap = Map<String, String>();

    for (List<String> param in params) {
      oauthList.add('${Uri.encodeComponent(param[0])}=${Uri.encodeComponent(param[1])}');
      paramMap[param[0]] = param[1];
    }

    oauthList.sort();
    String oauthSig = 'oauth_signature="${Uri.encodeComponent(generateSignature("GET", "https://api.twitter.com$base", oauthList))}"';

    return await http.get(new Uri.https("api.twitter.com", base, paramMap), headers: {
      "Authorization": 'Oauth $oauthConsumer, $oauthNonce, $oauthSig, $oauthMethod, $oauthTime, $oauthToken, $oauthVersion',
      "Content-Type": "application/json"
    }).timeout(Duration(seconds: 15));
  }

  static Future<TweetList> getTweetsFromUser(String tag) async {
    String base = '/1.1/statuses/user_timeline.json';
    final response = await _twitterGet(base, [
      ["screen_name", tag],
      ["tweet_mode", "extended"]
    ]);

    if (response.statusCode == 200) {
      try {
        return TweetList.fromJson(json.decode(response.body));
      } catch (e) {
        print("An error has occurred: $e");
        return null;
      }
    } else {
      print("Error retrieving tweets: ${response.body}");
      return null;
    }
  }

}
