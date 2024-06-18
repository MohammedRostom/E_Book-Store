import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';

class Cust_ProfileSlide extends StatelessWidget {
  Cust_ProfileSlide({
    super.key,
    this.TopText,
    this.undertext,
    required this.removeBRightBorder,
  });

  final bool removeBRightBorder;
  final TopText, undertext;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Cust_text(
                TeStyle: ThemeText(context).headlineLarge!.copyWith(
                    color: AppColor.primaryColor, fontWeight: FontWeight.w500),
                TextT: TopText),
            Cust_text(
                TeStyle: ThemeText(context).titleMedium!, TextT: undertext),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              width: 0.8,
              color: ThemeText(context).titleMedium!.color!.withOpacity(0.2)),
          right: removeBRightBorder
              ? BorderSide.none
              : BorderSide(
                  color:
                      ThemeText(context).titleMedium!.color!.withOpacity(0.2)),
          bottom: BorderSide(
              width: 0.8,
              color: ThemeText(context).titleMedium!.color!.withOpacity(0.2)),
        ),
      ),
    );
  }
}
