import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/Signup/signupscreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/cart/cartscreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/favorits/favoritescreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/layouts/mainLyouts.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/login/loginscreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/profilascreen.dart';

import '../../features/featsures/presentation/view/detalis/detalisscreen.dart';
import '../../features/featsures/presentation/view/home/homescreen.dart';
import '../../features/featsures/presentation/view/pdfView/PdfViewer.dart';
import '../../features/featsures/presentation/view/splach/spalchScreen.dart';

class Routeing {
  static final Start = "/";
  static final Home = "Home";
  static final Layout = "layout";
  static final Login = "Login";
  static final Sginup = "Sginup";
  static final Profile = "Profile";
  static final Favorite = "favorite";
  static final Cart = "cart";
  static final detalis = "detaliss";
  static final PdfV = "PdfViewer";

  static Map<String, Widget Function(BuildContext)> MapOfAppRoutes = {
    Start: (context) => startScreen(),
    Layout: (context) => layouts(),
    Home: (context) => homescreen(),
    Login: (context) => LoginS(),
    Sginup: (context) => Signup(),
    Profile: (context) => ProfileS(),
    Favorite: (context) => favoriteS(),
    Cart: (context) => Carts(),
    detalis: (context) => detaliss(),
    PdfV: (context) => PdfViewer(),
  };
}
