import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/Cashe/Cache.dart';
import '../../../../../../core/utils/const.dart';

part 'comm_state.dart';

class CommCubit extends Cubit<CommState> {
  CommCubit() : super(CommInitial());
  static CommCubit get(context) => BlocProvider.of(context);

  int SelectedIndex = 0;
  void ChangeIndex(index) {
    SelectedIndex = index;
    print(SelectedIndex);
    emit(Change_Index());
  }

  bool isLight = false;
  void ChangeTheme({bool? change}) {
    if (change != null) {
      isLight = change;
    } else {
      isLight = !isLight;
    }
    PreferencesService.setCache(ThemeModeKey, isLight);
    emit(Change_Theme());
    print(" from Emit : $isLight");
  }

  List<String> Locals = ["en", "ar", "fr"];
  int indexLanguageSelected = 0;
  changeLanguage(index) {
    indexLanguageSelected = index;
    PreferencesService.setCache(LanuageIndexkey, index);
    emit(Change_Local());
  }
}
