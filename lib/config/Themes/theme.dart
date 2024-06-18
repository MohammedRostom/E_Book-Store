import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes {
  static final ThemeData LighTheme = ThemeData(
      useMaterial3: false,
      colorScheme: ThemeData().colorScheme.copyWith(
          brightness: Brightness.light,
          primaryContainer: AppColor.primaryColor,
          secondaryContainer: AppColor.GaryColorApp,
          tertiaryContainer: Colors.white),
      cardColor: Colors.black.withOpacity(0.3),
      textTheme: TextTheme(
        labelLarge: TextStyle(
          fontSize: 32.sp,
          color: Colors.black,
        ),
        headlineLarge: TextStyle(fontSize: 24.sp, color: AppColor.BlackColor),
        titleLarge: TextStyle(fontSize: 20.sp, color: Colors.black),
        titleMedium:
            TextStyle(fontSize: 15.sp, color: Colors.black.withOpacity(0.9)),
        titleSmall: TextStyle(
            color: AppColor.BlackAppColorWithOpacity, fontSize: 12.sp),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      iconTheme:
          IconThemeData(color: AppColor.BlackColor, size: WsvgIconAppBar));
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  static final ThemeData DarkTheme = ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
          primaryContainer: AppColor.primaryColor,
          secondaryContainer: AppColor.primaryColor.withOpacity(0.5),
          tertiaryContainer: Colors.black),
      cardColor: Colors.black.withOpacity(0.4),
      scaffoldBackgroundColor: Color.fromARGB(255, 13, 13, 14),
      textTheme: TextTheme(
        labelLarge: TextStyle(
          fontSize: 32.sp,
          color: Colors.white,
        ),
        headlineLarge:
            TextStyle(fontSize: 24.sp, color: Colors.white.withOpacity(0.8)),
        titleLarge: TextStyle(fontSize: 20.sp, color: Colors.white),
        titleMedium:
            TextStyle(fontSize: 15.sp, color: Colors.white.withOpacity(0.9)),
        titleSmall: TextStyle(
            color: AppColor.BlackAppColorWithOpacity, fontSize: 12.sp),
      ),
      iconTheme: IconThemeData(color: Colors.white, size: WsvgIconAppBar));
}
