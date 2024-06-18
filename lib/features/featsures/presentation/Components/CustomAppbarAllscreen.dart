import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/CustomAppbarIcon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbarAllscreen extends StatelessWidget {
  CustomAppbarAllscreen({
    super.key,
    this.RightIcon,
    this.LeftIcon,
    this.IconColor,
    this.CenterText,
    this.onTapLeftIcon,
    this.onTapRightIcon,
    this.MakeSpacerBetweenTwoElement,
    this.visibleLeftIcon,
    this.Notific,
  });

  final RightIcon,
      LeftIcon,
      IconColor,
      CenterText,
      MakeSpacerBetweenTwoElement,
      visibleLeftIcon;
  Widget? Notific;

  MainAxisAlignment? BeStart;
  void Function()? onTapLeftIcon, onTapRightIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60.h,
        child: Row(
            mainAxisAlignment: BeStart ?? MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: visibleLeftIcon ?? true,
                child: InkWell(
                  onTap: onTapLeftIcon,
                  child: CustomAppbarIcon(
                    SvgOrIcon: LeftIcon,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Cust_text(
                    TeStyle: ThemeText(context)
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                    TextT: CenterText ?? "Title here"),
              ),
              Visibility(
                  visible: MakeSpacerBetweenTwoElement ?? false,
                  child: Spacer()),
              InkWell(
                  onTap: onTapRightIcon,
                  child: CustomAppbarIcon(
                      Notific: Notific,
                      SvgOrIcon: RightIcon,
                      IconColor: IconColor)),
            ]));
  }
}
