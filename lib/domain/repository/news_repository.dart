import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/news_model.dart';

abstract class NewsRepository{
  Future<Either<Exception, List<NewsModel>>> getNews();
}