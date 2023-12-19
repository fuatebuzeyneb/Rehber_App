part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomePeriodsLoading extends HomeState {}

final class HomePeriodsSuccess extends HomeState {}

final class HomePeriodsFailure extends HomeState {
  final String errorMsg;

  HomePeriodsFailure(this.errorMsg);
}

final class HomeCharactersLoading extends HomeState {}

final class HomeCharactersSuccess extends HomeState {}

final class HomeCharactersFailure extends HomeState {
  final String errorMsg;

  HomeCharactersFailure(this.errorMsg);
}
