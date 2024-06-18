import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenterText extends StatelessWidget {
  const CenterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthOfScreen(context),
      height: 45.h,
      child: Padding(
        padding: EdgeInsets.only(top: 6.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Cust_text(
                TeStyle: ThemeText(context)
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
                TextT: S.of(context).Popular_ebook),
            Cust_text(
                TeStyle: ThemeText(context).titleSmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primaryColor),
                TextT: S.of(context).Read_more),
          ],
        ),
      ),
    );
  }
}
