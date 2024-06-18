import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers_cubits/Controllers_cubits.dart';
part 'Search_state.dart';

class Search_cubit extends Cubit<Search_state> {
  Search_cubit() : super(SearchInitial());
  static Search_cubit get(context) => BlocProvider.of(context);

  void SearchBooks(String OrderSearch, context) {
    try {
      home_controller(context).Getbooks(Query: OrderSearch);
      emit(SearchDone());
    } on Exception catch (e) {
      Exception(e.toString());
    }
  }
}
