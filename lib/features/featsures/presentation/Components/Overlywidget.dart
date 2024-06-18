import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class overlyWidget extends StatelessWidget {
  const overlyWidget(
      {super.key, this.LoaderLottieType, this.BgColor, this.WidthOfLoader});

  final LoaderLottieType;
  final Color? BgColor;
  final double? WidthOfLoader;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(WidthOfLoader ?? 140.r),
      alignment: Alignment.center,
      width: widthOfScreen(context),
      height: HightOfScreen(context),
      color: BgColor ?? Colors.white.withOpacity(0.8),
      child: Lottie.asset(LoaderLottieType),
    );
  }
}
