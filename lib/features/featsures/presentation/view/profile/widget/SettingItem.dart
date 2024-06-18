import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../generated/l10n.dart';
import '../../../blocs/controllers_cubits/Controllers_cubits.dart';

class SettingItem extends StatelessWidget {
  SettingItem({
    super.key,
    this.index,
    this.onTap,
  });
  final index;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? null,
      child: Padding(
        padding: EdgeInsets.only(top: 7.r),
        child: Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                ProfileItemsFunc(context)[index][IconPath]!,
                color: index == ProfileItemsFunc(context).length - 1
                    ? Colors.red
                    : ThemeText(context).titleMedium!.color,
                height:
                    index == ProfileItemsFunc(context).length - 1 ? 28.h : 24,
              ),
              SizedBox(
                width: 12.w,
              ),
              Cust_text(
                TextT: ProfileItemsFunc(context)[index][T_Lebal]!,
                TeStyle: ThemeText(context).titleMedium!.copyWith(
                    color: index == ProfileItemsFunc(context).length - 1
                        ? Colors.red
                        : ThemeText(context)
                            .titleMedium!
                            .color!
                            .withOpacity(0.7),
                    fontWeight: FontWeight.w400),
              ),
              Spacer(),
              index == ProfileItemsFunc(context).length - 2
                  ? SvgPicture.asset(
                      Comm_controller(context).isLight
                          ? Assets.Darkmode
                          : ProfileItemsFunc(context)[3][IconPath]!,
                      color: AppColor.primaryColor,
                      height: 24.h,
                    )
                  : index == 2
                      ? Text(
                          AppLanguages[
                              Comm_controller(context).indexLanguageSelected],
                          style: ThemeText(context).titleMedium,
                        )
                      : Text("")
            ],
          ),
          height: 45.h,
        ),
      ),
    );
  }
}
