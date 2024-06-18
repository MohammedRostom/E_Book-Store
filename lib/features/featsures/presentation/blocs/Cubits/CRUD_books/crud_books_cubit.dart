import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/featsures/data/models/book_model.dart';
import 'package:flutter_application_2/features/featsures/data/models/single_booktModel.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/data_sources/local/databsesTables.dart';

part 'crud_books_state.dart';

class CrudBooksCubit extends Cubit<CrudBooksState> {
  CrudBooksCubit() : super(CrudBooksInitial());
  static CrudBooksCubit get(context) => BlocProvider.of(context);
  DataBasesHelper Opj = DataBasesHelper.db;
  List<single_booktModel?> CartBooks = [];
  Future<void> insertBooktoCart(single_booktModel model) async {
    try {
      await Opj.insertIntoCart(model: model);
      GetAllBooksFromCart();
      getTotalPrice(CartBooks);
      emit(AddbookToCart());
    } on Exception catch (e) {
      Exception(e);
    }
  }

  Future<void> insertBooktoFav(
    BookItem model,
  ) async {
    try {
      await Opj.insertIntoFav(
        model: model,
      );
      print("==============?=>${model.id}");

      GetAllBooksFromFav();
      emit(CrudBooksDone());
    } catch (e) {
      emit(CrudBooksError());
      print(e.toString());
    }
  }

  Future<List<single_booktModel?>?> GetAllBooksFromCart() async {
    try {
      List<single_booktModel?> books = await Opj.GetDataAllfromCartTable();
      print("length Books From Cart ====>: ${books.length}");
      CartBooks = books;
      emit(CrudBooksDone());
      return CartBooks;
    } catch (e) {
      print(e.toString());
      emit(CrudBooksError());
    }
  }

  List<BookItem?> FavBooks = [];
  Future<List<BookItem?>?> GetAllBooksFromFav() async {
    try {
      List<BookItem?> books = await Opj.GetDataAllfromFavoriteTable();
      print("From Favorite ====>: ${books.length}");
      FavBooks = books;
      emit(CrudBooksDone());
      return FavBooks;
    } catch (e) {
      print(e.toString());
      emit(CrudBooksError());
    }
  }

  Future<void> RemoveItem({required Id, TableName}) async {
    if (TableName == FavoriteTable) {
      print(Id);
      await Opj.DeleteFromFavoriteTable(Id);
      GetAllBooksFromFav();
      emit(CrudBooksDone());
    } else if (TableName == CartTable) {
      print(Id);
      await Opj.DeleteFromCartTable(Id);
      GetAllBooksFromCart();
      emit(CrudBooksDone());
    }
  }

  double total = 0.0;
  double getTotalPrice(List<single_booktModel?> products) {
    return products.fold(0.0,
        (total, product) => total + double.parse(product!.price!.substring(1)));
  }
}
