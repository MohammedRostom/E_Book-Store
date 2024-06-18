import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/String.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/Cashe/Cache.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/style/Colors.dart';
import '../../../../../../core/utils/style/Sizes.dart';
import '../../../../../../generated/l10n.dart';
import '../../../Components/C_Text.dart';
import '../../../Components/CustomAppbarIcon.dart';

class Fristsection extends StatelessWidget {
  const Fristsection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cust_text(
                    color: ThemeText(context).headlineLarge!.color,
                    TextT: S.of(context).Welcome_back,
                    TeStyle: ThemeText(context)
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Cust_text(
                      TextT:
                          "Hi, ${PreferencesService.getUserName("Username")}",
                      TeStyle: ThemeText(context).titleLarge!.copyWith(
                          color: ThemeText(context)
                              .titleLarge!
                              .color!
                              .withOpacity(0.5))),
                ],
              ),
              InkWell(
                  child: CustomAppbarIcon(
                SvgOrIcon: Assets.Noitfic,
              ))
            ],
          ),
        ));
  }
}
