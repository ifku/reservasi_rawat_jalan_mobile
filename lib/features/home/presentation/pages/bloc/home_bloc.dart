import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/entities/user_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/domain/use_cases/user/get_user_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/news_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/upcoming_schedule_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/use_cases/get_news_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/use_cases/get_upcoming_schedule_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetNewsUseCase _getNewsUseCase;
  final GetUpcomingScheduleUseCase _getUpcomingSchedule;
  final GetUserUseCase _getUserUseCase;

  HomeBloc(
    this._getNewsUseCase,
    this._getUpcomingSchedule,
    this._getUserUseCase,
  ) : super(HomeLoading()) {
    on<FetchHomeData>((event, emit) async {
      emit(HomeLoading());

      final newsResult = await _getNewsUseCase.call(null);
      final upcomingScheduleResult = await _getUpcomingSchedule.call(null);

      if (newsResult.isLeft() || upcomingScheduleResult.isLeft()) {
        emit(const HomeFailure(message: "Error fetching data"));
      } else {
        final newsData = newsResult.getOrElse(() => []);
        final upcomingScheduleData = upcomingScheduleResult.getOrElse(() => []);
        final user = await _getUserUseCase.call(null);
        final userData = user.fold((l) => null, (r) => r);

        emit(HomeSuccess(
            news: newsData,
            upcomingSchedule: upcomingScheduleData,
            user: userData!));
      }
    });
  }
}
