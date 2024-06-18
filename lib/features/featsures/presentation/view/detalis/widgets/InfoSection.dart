import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/style/String.dart';
import 'package:flutter_application_2/features/featsures/data/models/single_booktModel.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../../../../core/Methods/Alert.dart';
import '../../../../../../core/utils/const.dart';
import '../../../../../../core/utils/style/Colors.dart';
import '../../../../../../core/utils/style/Sizes.dart';
import '../../../../../../generated/l10n.dart';
import '../../../Components/C_Text.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
    required this.Model,
  });

  final single_booktModel Model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: SizedBox(
          width: widthOfScreen(context),
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Cust_text(
                    TeStyle: ThemeText(context).titleLarge!.copyWith(
                          fontSize: 24.sp,
                        ),
                    MaxLins: 2,
                    overflow: TextOverflow.ellipsis,
                    TextT: Model.title!),
                Cust_text(
                    TeStyle: ThemeText(context)
                        .titleMedium!
                        .copyWith(fontSize: 15.sp, fontWeight: FontWeight.bold),
                    TextT: "Publisher :${Model.publisher!}",
                    MaxLins: 1,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 5.h,
                ),
                Cust_text(
                    overflow: TextOverflow.ellipsis,
                    MaxLins: 4,
                    textAlign: TextAlign.center,
                    TeStyle: ThemeText(context).titleMedium!.copyWith(
                        color: ThemeText(context)
                            .titleMedium!
                            .color!
                            .withOpacity(0.5)),
                    TextT: Model.desc!),
              ]),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Cust_text(
                          TeStyle: ThemeText(context).titleLarge!.copyWith(
                              fontSize: 32.sp, color: AppColor.primaryColor),
                          TextT: "${Model.price!.substring(0, 5)}"),
                      Cust_text(
                          TeStyle: ThemeText(context)
                              .titleMedium!
                              .copyWith(fontSize: 20.sp),
                          TextT: "/E-book"),
                    ],
                  ),
                  // add to cart btn
                  CustBtn(
                    model: Model,
                    onTap: () => CrudBooks_controller(context)
                        .insertBooktoCart(Model)
                        .then((value) => Alert(
                            title: S.of(context).alert_Title,
                            Text: S.of(context).alert_SubTitle,
                            context: context,
                            State: QuickAlertType.success)),
                    textBtn: S.of(context).Add_to_Cart,
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class CustBtn extends StatelessWidget {
  CustBtn({
    super.key,
    this.width,
    this.height,
    this.textBtn,
    this.onTap,
    this.model,
  });

  final width, height;
  final String? textBtn;
  void Function()? onTap;

  final single_booktModel? model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Cust_text(
            TeStyle: ThemeText(context)
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            TextT: textBtn! ?? ""),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 6,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(EdgesPorderRaduis),
            color: AppTheme(context).colorScheme.primaryContainer),
        width: width ?? 140.w,
        height: height ?? 50.h,
      ),
    );
  }
}
