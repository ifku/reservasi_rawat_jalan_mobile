import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String title;
  final String author;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  const NewsEntity({
    required this.title,
    required this.author,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  @override
  List<Object> get props =>
      [title, author, url, urlToImage, publishedAt, content];
}
