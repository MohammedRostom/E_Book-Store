part of 'profile_photo_cubit_cubit.dart';

@immutable
sealed class ProfilePhotoCubitState {}

final class ProfilePhotoCubitInitial extends ProfilePhotoCubitState {}

final class ProfilePhotoLoading extends ProfilePhotoCubitState {}

final class ProfilePhotoDone extends ProfilePhotoCubitState {}

final class ProfilePhotoError extends ProfilePhotoCubitState {}
