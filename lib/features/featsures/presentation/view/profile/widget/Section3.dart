import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Comm_cubit/comm_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/widget/SettingItem.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/widget/modelSheetLanguage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class section3 extends StatelessWidget {
  const section3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommCubit, CommState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Expanded(
            flex: 4,
            child: Column(
              children: List.generate(
                  ProfileItemsFunc(context).length,
                  (index) => SettingItem(
                        onTap: index == 4
                            ? () async {
                                Auth_controller(context).LogOut(context);
                                print(index);
                              }
                            : index == 3
                                ? () {
                                    print(index);
                                    Comm_controller(context).ChangeTheme();
                                  }
                                : index == 2
                                    ? () {
                                        print(index);

                                        showModalBottomSheetd(context);
                                        ;
                                      }
                                    : null,
                        index: index,
                      )),
            ));
      },
    );
  }
}
