import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cust_TextForm extends StatelessWidget {
  const Cust_TextForm({
    super.key,
    required this.labelText,
    required this.hintText,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.inputype,
  });

  final String labelText, hintText;
  final bool? obscureText;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? inputype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5.r),
            child: Cust_text(
              TeStyle: ThemeText(context)
                  .titleMedium!
                  .copyWith(color: Colors.black.withOpacity(0.7)),
              TextT: labelText,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColor.GaryColorApp,
              borderRadius: BorderRadius.circular(PadddingItems),
            ),
            child: TextFormField(
              controller: controller,
              obscureText: obscureText ?? false,
              keyboardType: inputype ?? TextInputType.text,
              validator: validator,
              decoration: InputDecoration(
                focusColor: AppColor.primaryColor,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
