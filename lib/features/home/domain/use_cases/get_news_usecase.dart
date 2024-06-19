import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/news_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/repositories/news_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';

class GetNewsUseCase implements UseCase<List<NewsModel>, void> {
  final _newsRepository = locator<NewsRepository>();

  @override
  Future<Either<Exception, List<NewsModel>>> call(void params) async {
    return await _newsRepository.getNews();
  }
}
