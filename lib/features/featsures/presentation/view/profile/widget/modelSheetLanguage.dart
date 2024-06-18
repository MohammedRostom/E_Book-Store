// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/widget/langugeItem.dart';
import 'package:flutter_application_2/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showModalBottomSheetd(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      decoration: BoxDecoration(
        color: AppTheme(context).colorScheme.tertiaryContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.withOpacity(0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 9), // changes position of shadow
          ),
        ],
      ),
      width: double.infinity,
      height: 190.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Container(
              alignment: Alignment.center,
              child: Cust_text(
                  TeStyle:
                      ThemeText(context).titleMedium!.copyWith(fontSize: 18.sp),
                  TextT: S.of(context).Select_Language),
            ),
          ),
          Divider(
            color: AppColor.GaryColorApp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                AppLanguages.length,
                (index) => langugeItem(
                      index: index,
                    )),
          ),
        ],
      ),
    ),
  );
}
