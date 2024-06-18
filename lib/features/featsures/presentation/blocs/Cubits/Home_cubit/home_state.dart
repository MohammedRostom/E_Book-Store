part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingData extends HomeState {}

final class DataDone extends HomeState {}

final class DataSingleBookeDone extends HomeState {}

final class DataError extends HomeState {}
