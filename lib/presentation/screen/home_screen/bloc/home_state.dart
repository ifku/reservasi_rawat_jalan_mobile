part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState{
  final List<NewsModel> news;

  const HomeSuccess({required this.news});
  @override
  List<Object> get props => [news];
}
class HomeFailure extends HomeState{
  final String message;
  const HomeFailure({required this.message});
  @override
  List<Object> get props => [message];
}
