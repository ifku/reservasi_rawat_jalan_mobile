class NewsModel {
  String title;
  String author;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  NewsModel(
      {required this.title,
      required this.author,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        title: json['title'],
        author: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: DateTime.parse(json['publishedAt']),
        content: json['content']);
  }
}
