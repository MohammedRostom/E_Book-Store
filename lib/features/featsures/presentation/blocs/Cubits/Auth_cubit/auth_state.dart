part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class Loadeing extends AuthState {}

final class insertUserDone extends AuthState {}

final class insertUserError extends AuthState {}

final class LoginUser extends AuthState {}

final class LoginError extends AuthState {}

final class Logout extends AuthState {}

final class Any_Action extends AuthState {}

final class Keep_logined extends AuthState {}
