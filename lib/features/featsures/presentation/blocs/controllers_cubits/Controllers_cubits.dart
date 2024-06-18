import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/CRUD_books/crud_books_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/profile_photo_cubit_cubit/profile_photo_cubit_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/pdf_viewer_cubit/pdf_viewer_cubit.dart';
import '../Cubits/Auth_cubit/auth_cubit.dart';
import '../Cubits/Comm_cubit/comm_cubit.dart';
import '../Cubits/Home_cubit/home_cubit.dart';
import '../Cubits/Search_cubit/Search_cubit.dart';

HomeCubit home_controller(context) => HomeCubit.get(context);
CommCubit Comm_controller(context) => CommCubit.get(context);
Search_cubit Search_controller(context) => Search_cubit.get(context);
PdfViewerCubit Pdf_controller(context) => PdfViewerCubit.get(context);
CrudBooksCubit CrudBooks_controller(context) => CrudBooksCubit.get(context);
AuthCubit Auth_controller(context) => AuthCubit.get(context);
ProfilePhotoCubit Photo_Controller(context) => ProfilePhotoCubit.get(context);
