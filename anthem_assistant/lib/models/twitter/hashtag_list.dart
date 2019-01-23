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