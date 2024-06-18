import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.iconPath,
    required this.text,
  });
  final String iconPath, text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          height: 14.h,
          color: ThemeText(context).titleMedium!.color!.withOpacity(0.5),
        ),
        SizedBox(
          width: 4.h,
        ),
        Text(
          text,
          style: TextStyle(
              color: ThemeText(context).titleMedium!.color!.withOpacity(0.5)),
        ),
      ],
    );
  }
}
