part of 'comm_cubit.dart';

@immutable
sealed class CommState {}

final class CommInitial extends CommState {}

final class Change_Index extends CommState {}

final class Change_Theme extends CommState {}

final class Change_Local extends CommState {}
