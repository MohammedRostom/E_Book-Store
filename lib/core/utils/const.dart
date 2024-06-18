import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/cart/cartscreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/favorits/favoritescreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/home/homescreen.dart';

import '../../features/featsures/presentation/view/profile/profilascreen.dart';
import '../../generated/l10n.dart';
import 'style/String.dart';

ThemeData AppTheme(context) => Theme.of(context);
TextTheme ThemeText(context) => AppTheme(context).textTheme;
String T_Lebal = "T_Lebal";
String IconPath = "IconPath";
List<Map<String, String>> ItemNavga(context) {
  return [
    {T_Lebal: S.of(context).HomeT, IconPath: Assets.home},
    {T_Lebal: S.of(context).FavoriteT, IconPath: Assets.Favorite},
    {T_Lebal: S.of(context).CartT, IconPath: Assets.Cart},
    {T_Lebal: S.of(context).ProfileT, IconPath: Assets.Profile},
  ];
}

List<Map<String, String>> ProfileItemsFunc(context) {
  return [
    {T_Lebal: S.of(context).FavoriteT, IconPath: Assets.Favorite},
    {T_Lebal: S.of(context).Tell_your_Friends, IconPath: Assets.people},
    {T_Lebal: S.of(context).language, IconPath: Assets.language},
    {T_Lebal: S.of(context).Dark_Light, IconPath: Assets.Lightmode},
    {T_Lebal: S.of(context).LOG_OUT, IconPath: Assets.logout},
  ];
}

List<Widget> Screens = [homescreen(), favoriteS(), Carts(), ProfileS()];

class URls {
  static final HeroSectionImge =
      "https://www.creativefabrica.com/wp-content/uploads/2023/08/08/Collection-of-Books-Seamless-Pattern-Graphics-76463207-1-1-580x387.png";
  static final DefalutProfileImge =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png";

  static final PaseUrl = "https://api.itbook.store/1.0/";
  static final pathNewBooks = "new";
  static final pathSearchKooks = "search/";
  static final pathSingleBook = "books/";
}

List<String> AppLanguages = ["English", "العربية", "Franch"];
final LanuageIndexkey = "LanuageIndex";
final ThemeModeKey = "ThemeModeKey";
final uid = "uidkey";
final UsernameKey = "Username";
final RoleKey = "Role";
final EmailKey = "Email";
final PhoneKey = "Phone";
final ImagePathkey = "ImagePath";
