import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/home/widgets/SearchBar.dart';

import '../../../../../../core/utils/const.dart';
import '../../../../../../core/utils/style/Sizes.dart';
import '../../../../../../core/utils/style/String.dart';
import '../../../../../../generated/l10n.dart';
import '../../../Components/C_Text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class secondsection extends StatelessWidget {
  const secondsection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              width: widthOfScreen(context),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
              child: Opacity(
                opacity: 0.220,
                child: Image.network(fit: BoxFit.fill, URls.HeroSectionImge),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Cust_text(
                    TeStyle: ThemeText(context).headlineLarge!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    TextT: S.of(context).Search_ebookHead),
                Padding(
                  padding: EdgeInsets.only(top: 2.r),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15.r),
                    child: SearchBsar(),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
                    width: 250.w,
                    height: 50.h,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
