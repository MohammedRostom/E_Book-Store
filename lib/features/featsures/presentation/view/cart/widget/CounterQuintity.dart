import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/detalis/widgets/InfoSection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Components/C_Text.dart';

class CounterQuintity extends StatelessWidget {
  const CounterQuintity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustBtn(
            height: 25.0.h,
            textBtn: "-",
            width: 40.0.h,
          ),
          Cust_text(
              MaxLins: 1,
              overflow: TextOverflow.ellipsis,
              TeStyle: ThemeText(context).titleLarge!,
              TextT: "1"),
          CustBtn(
            height: 25.0.h,
            textBtn: "+",
            width: 40.0.h,
          )
        ],
      ),
      height: 35.h,
      width: 120.w,
    );
  }
}
