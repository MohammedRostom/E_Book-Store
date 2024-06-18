import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Cashe/Cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/book_model.dart';
import '../../../../data/models/single_booktModel.dart';
import '../../../../data/repositories_impl/booksRepo.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<BookItem> BooksList = [];
  bool Isloding = false;

  Future<List<BookItem>?> GetAllbooks() async {
    Isloding = true;
    emit(LoadingData());
    try {
      List<BookItem> books = await Bookrepo().GetAllBooks();
      BooksList = books;
      print("====================> ${BooksList.length}");
      Isloding = false;
      emit(DataDone());
    } catch (e) {
      print(e.toString());
      emit(DataError());
    }
  }

  Future<List<BookItem>?> Getbooks({String? Query}) async {
    Isloding = true;
    emit(LoadingData());
    try {
      List<BookItem> books = await Bookrepo().GetBooks(Query: Query);
      BooksList.clear();
      BooksList = books;
      Isloding = false;
      emit(DataDone());
    } catch (e) {
      print(e.toString());
      emit(DataError());
    }
  }

  late single_booktModel Book;
  bool IslodingSingleBook = false;
  Future<single_booktModel?> GetSingleBook({required String isbn13}) async {
    IslodingSingleBook = true;
    emit(LoadingData());
    try {
      single_booktModel book = await Bookrepo().GetSingleBook(isbn13: isbn13);
      Book = book;
      print(Book.price);
      IslodingSingleBook = false;
      emit(DataSingleBookeDone());
      return Book;
    } catch (e) {
      print(e.toString());
      emit(DataError());
    }
  }

  GetUserinfoWhenAtHome() async {
    PreferencesService.getUserName("Username");
    PreferencesService.getUserName(
      "Role",
    );
    PreferencesService.getUserName(
      "Email",
    );
    PreferencesService.getUserName(
      "Phone",
    );
    emit(DataDone());
  }
}
