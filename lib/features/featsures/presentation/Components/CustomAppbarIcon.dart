import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/const.dart';
import '../../../../core/utils/style/Sizes.dart';

class CustomAppbarIcon extends StatelessWidget {
  CustomAppbarIcon({
    super.key,
    this.SvgOrIcon,
    this.IconColor,
    this.Notific,
    this.height,
  });
  final dynamic SvgOrIcon;
  Color? IconColor;
  Widget? Notific;
  double? height;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.r,
      backgroundColor: Colors.transparent,
      child: SvgOrIcon.runtimeType == String
          ? Stack(
              alignment: Alignment.topLeft,
              children: [
                SvgPicture.asset(
                  SvgOrIcon,
                  width: WsvgIconAppBar,
                  height: height ?? 24.h,
                  color: IconColor ?? AppTheme(context).iconTheme.color,
                ),
                Notific ?? Text(""),
              ],
            )
          : SvgOrIcon.runtimeType == IconData
              ? Icon(SvgOrIcon,
                  color: IconColor ?? AppTheme(context).iconTheme.color)
              : null,
    );
  }
}
