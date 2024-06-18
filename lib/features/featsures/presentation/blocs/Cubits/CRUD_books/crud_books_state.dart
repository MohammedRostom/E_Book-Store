part of 'crud_books_cubit.dart';

@immutable
sealed class CrudBooksState {}

final class CrudBooksInitial extends CrudBooksState {}

final class CrudBooksLoading extends CrudBooksState {}

final class CrudBooksDone extends CrudBooksState {}

final class CrudBooksError extends CrudBooksState {}

final class AddbookToCart extends CrudBooksState {}
