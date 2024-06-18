import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/core/utils/style/String.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/profile_photo_cubit_cubit/profile_photo_cubit_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/widget/InfoWidget.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/widget/PickImageZone.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Cashe/Cache.dart';
import '../../../../../../generated/l10n.dart';

class FristSection extends StatelessWidget {
  FristSection({
    required this.state,
    super.key,
  });
  ProfilePhotoCubitState state;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppTheme(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                            radius: 53.r,
                            backgroundColor:
                                AppTheme(context).scaffoldBackgroundColor),
                        PickImageZone(
                          state: state,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Cust_text(
                            color: ThemeText(context)
                                .titleMedium!
                                .color!
                                .withOpacity(0.8),
                            TeStyle: ThemeText(context).headlineLarge!,
                            TextT:
                                PreferencesService.getUserName(UsernameKey)!),
                        Cust_text(
                            TeStyle: ThemeText(context).titleMedium!.copyWith(
                                color: ThemeText(context)
                                    .titleMedium!
                                    .color!
                                    .withOpacity(0.5)),
                            TextT: PreferencesService.getUserName(RoleKey)!),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Cust_text(
                  TeStyle: ThemeText(context).titleMedium!.copyWith(
                      color: ThemeText(context)
                          .titleMedium!
                          .color!
                          .withOpacity(0.7)),
                  TextT: S.of(context).Your_Information),
              SizedBox(
                height: 6.h,
              ),
              InfoWidget(
                iconPath: Assets.Call,
                text: PreferencesService.getUserName(PhoneKey)!,
              ),
              SizedBox(
                height: 9.h,
              ),
              InfoWidget(
                iconPath: Assets.Email,
                text: PreferencesService.getUserName(EmailKey)!,
              ),
            ],
          ),
        ));
  }
}
