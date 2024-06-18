import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/featsures/data/models/user_model.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Auth_cubit/auth_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/CRUD_books/crud_books_cubit.dart';
import '../../features/featsures/presentation/blocs/Cubits/Comm_cubit/comm_cubit.dart';
import '../../features/featsures/presentation/blocs/Cubits/Home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/featsures/presentation/blocs/Cubits/Search_cubit/Search_cubit.dart';
import '../../features/featsures/presentation/blocs/Cubits/profile_photo_cubit_cubit/profile_photo_cubit_cubit.dart';
import '../../features/featsures/presentation/blocs/Cubits/pdf_viewer_cubit/pdf_viewer_cubit.dart';
import 'materialApp.dart';

class StartManger extends StatelessWidget {
  const StartManger({
    super.key,
    this.myThemeMode,
  });
  final myThemeMode;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create: (context) => HomeCubit()
            ..GetAllbooks()
            ..GetUserinfoWhenAtHome(),
        ),
        BlocProvider(
          create: (context) => CommCubit()..ChangeTheme(change: myThemeMode),
        ),
        BlocProvider(
          create: (context) => Search_cubit(),
        ),
        BlocProvider(
          create: (context) => PdfViewerCubit(),
        ),
        BlocProvider(
          create: (context) => CrudBooksCubit()
            ..GetAllBooksFromCart()
            ..GetAllBooksFromFav(),
        ),
        BlocProvider(create: (context) => ProfilePhotoCubit())
      ],
      child: materialApp(
        mode: myThemeMode,
      ),
    );
  }
}
