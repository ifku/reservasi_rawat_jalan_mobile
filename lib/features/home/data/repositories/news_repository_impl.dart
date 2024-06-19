import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/data_sources/news_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/news_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsDataSource _newsDataSource = locator<NewsDataSource>();

  @override
  Future<Either<Exception, List<NewsModel>>> getNews() async {
    return await _newsDataSource.getNews();
  }
}
