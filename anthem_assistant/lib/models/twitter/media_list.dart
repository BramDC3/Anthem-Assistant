class MediaList {
  final List<String> urls;

  MediaList({
    this.urls,
  });

  factory MediaList.fromJson(List<dynamic> json) {
    List<String> urls = new List<String>();
    if (json != null) {
      urls = json
        .map((h) => (h as Map<String, dynamic>)['media_url_https'].toString())
        .toList();
    }

    return new MediaList(
      urls: urls,
    );
  }
}
