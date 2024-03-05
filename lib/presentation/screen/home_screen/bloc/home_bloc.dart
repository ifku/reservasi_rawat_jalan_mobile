import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/data/model/news_model.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/news_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final NewsRepository newsRepository = locator<NewsRepository>();
  HomeBloc() : super(HomeLoading()) {
    on<FetchHomeData>((event, emit) {
      emit(HomeLoading());
      newsRepository.getNews().then((value) {
        value.fold(
          (l) => emit(HomeFailure(message: l.toString())),
          (r) => emit(HomeSuccess(news: r)),
        );
      });
    });
  }
}
