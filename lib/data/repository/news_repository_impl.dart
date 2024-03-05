
import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/news_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/news_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/news_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';


class NewsRepositoryImpl extends NewsRepository{
    final NewsDataSource _newsDataSource = locator<NewsDataSource>();
  @override
  Future<Either<Exception, List<NewsModel>>> getNews() async {
    return await _newsDataSource.getNews();
  }
}