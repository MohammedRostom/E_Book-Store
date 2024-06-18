import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/routers/routers.dart';
import 'package:flutter_application_2/core/Cashe/Cache.dart';
import 'package:flutter_application_2/features/featsures/data/models/user_model.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Comm_cubit/comm_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/Themes/theme.dart';
import '../../core/utils/const.dart';
import '../../generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class materialApp extends StatelessWidget {
  const materialApp({
    super.key,
    this.mode,
  });

  final mode;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommCubit, CommState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return MaterialApp(
            locale: Locale(Comm_controller(context).Locals[
                PreferencesService.getInt(LanuageIndexkey) == null
                    ? Comm_controller(context).indexLanguageSelected
                    : PreferencesService.getInt(LanuageIndexkey)!]),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: Comm_controller(context).isLight ||
                    PreferencesService.getbool(ThemeModeKey) == null
                ? Themes.LighTheme
                : Themes.DarkTheme,
            routes: Routeing.MapOfAppRoutes,
            initialRoute: PreferencesService.getUserName(UsernameKey) == null
                ? Routeing.Login
                : Routeing.Start);
      },
    );
  }
}
