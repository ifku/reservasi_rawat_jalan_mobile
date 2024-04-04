part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}


class FetchHomeData extends HomeEvent {
  const FetchHomeData();

  @override
  List<Object> get props => [];
}