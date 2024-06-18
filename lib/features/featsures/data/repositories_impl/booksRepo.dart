import '../data_sources/remote/RestApi.dart';
import '../models/book_model.dart';
import '../models/single_booktModel.dart';

class Bookrepo {
  Future<dynamic> GetAllBooks() async {
    try {
      List<dynamic> response = await GetDataFromApi().GetAllbooks();
      response.forEach((element) {
        BookItem book = BookItem.fromJson(element);
        books.add(book);
      });

      return books;
    } catch (e) {
      Exception(e.toString());
    }
  }

  List<BookItem> books = [];
  Future<dynamic> GetBooks({String? Query}) async {
    try {
      List<dynamic> response = await GetDataFromApi().Getbooks(Query: Query);
      response.forEach((element) {
        BookItem book = BookItem.fromJson(element);
        books.add(book);
      });

      return books;
    } catch (e) {
      Exception(e.toString());
    }
  }

  Future<dynamic> GetSingleBook({required String isbn13}) async {
    try {
      Map<String, dynamic> Book =
          await GetDataFromApi().GetSingleBook(isbn13: isbn13);
      single_booktModel bookmodel = single_booktModel.fromJson(Book);

      print(bookmodel.isbn13);
      return bookmodel;
    } catch (e) {
      Exception(e.toString());
    }
  }
}
