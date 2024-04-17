import 'package:reservasi_rawat_jalan_mobile/features/home/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel(
      {required super.title,
      required super.author,
      required super.url,
      required super.urlToImage,
      required super.publishedAt,
      required super.content});

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
