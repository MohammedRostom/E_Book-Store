import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Cashe/Cache.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/simple_bloc_observer.dart';
import '../core/utils/const.dart';
import 'Widgets/startManger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  await PreferencesService.init();
  print(PreferencesService.getInt(LanuageIndexkey));
  PreferencesService.getInt(LanuageIndexkey);

  runApp(EE_bookApp(
    myThemeMode: PreferencesService.getbool(ThemeModeKey),
  ));
}

class EE_bookApp extends StatelessWidget {
  const EE_bookApp({
    super.key,
    this.myThemeMode,
  });
  @override
  final myThemeMode;

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // builder Alwyes
      builder: (context, child) => StartManger(
        myThemeMode: myThemeMode,
      ),
    );
  }
}
