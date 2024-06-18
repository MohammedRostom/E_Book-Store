// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleFavorite extends StatelessWidget {
  const ToggleFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.r),
          child: Image.asset(
            Assets.AddFavo,
            width: 38.w,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
