import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/routers/routers.dart';
import 'package:flutter_application_2/core/Methods/Alert.dart';
import 'package:flutter_application_2/core/Methods/Navigator.dart';
import 'package:flutter_application_2/features/featsures/data/data_sources/remote/firebases_Auth.dart';
import 'package:flutter_application_2/features/featsures/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quickalert/models/quickalert_type.dart';
import '../../../../../../core/Methods/snackbar.dart';
import '../../../../data/data_sources/local/databsesTables.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static DataBasesHelper opj = DataBasesHelper.db;
  static AuthCubit get(context) => BlocProvider.of(context);

  List<UserModel?> Users = [];

  Future<void> AddNewUser({required UserModel User, context}) async {
    emit(Loadeing());
    try {
      Fire_Auth().signup(user: User).then((value) async {
        showSnackBar("Register  Successfully", context);
        await Future.delayed(Duration(milliseconds: 1500)).then((value) =>
            goToThisScreen(context: context, routeName: Routeing.Login));
      });

      emit(insertUserDone());
    } on Exception catch (e) {
      print(e.toString());
      emit(insertUserError());
    }
  }

  Future<void> Login({required User, Pass, context}) async {
    try {
      emit(Loadeing());
      await Fire_Auth().login(user: User, pass: Pass).whenComplete(() async {
        Alert(
            context: context,
            State: QuickAlertType.success,
            Text: "Login Successfully");
        await Future.delayed(Duration(seconds: 2));
        goToThisScreen(context: context, routeName: Routeing.Layout);
      });

      emit(LoginUser());
    } on Exception catch (e) {
      print(e.toString());
      emit(LoginError());
    }
  }

  Future<void> LogOut(context) async {
    await Fire_Auth().logout().then(
        (value) => goToThisScreen(context: context, routeName: Routeing.Login));
    emit(Logout());
  }

  bool Showpass = false;
  toogleVisblePassword() {
    Showpass = !Showpass;
    print(Showpass);
    emit(Any_Action());
    return Showpass;
  }
}
