part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final List<NewsModel> news;
  final List<UpcomingScheduleModel> upcomingSchedule;
  final UserEntity user;

  const HomeSuccess({required this.news, required this.upcomingSchedule, required this.user});

  @override
  List<Object> get props => [news, upcomingSchedule];
}

class HomeFailure extends HomeState {
  final String message;

  const HomeFailure({required this.message});

  @override
  List<Object> get props => [message];
}
