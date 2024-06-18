import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/features/featsures/data/models/book_model.dart';
import 'package:flutter_application_2/features/featsures/data/models/single_booktModel.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/Dismissiblebackground.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/cart/widget/CounterQuintity.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/favorits/widget/ToggleFavorite.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IteamFavOrCart extends StatelessWidget {
  IteamFavOrCart({
    super.key,
    required this.IsCart,
    this.onDismissed,
    this.model,
    this.Singlemodel,
  });
  final bool IsCart;
  final BookItem? model;
  final single_booktModel? Singlemodel;
  void Function(DismissDirection)? onDismissed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.r),
      child: Dismissible(
        onDismissed: onDismissed,
        key: GlobalKey(),
        background: Dismissiblebackground(),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: Comm_controller(context).isLight
                ? [
                    BoxShadow(
                      color: AppColor.GaryColorApp.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 8), // changes position of shadow
                    ),
                  ]
                : [],
            borderRadius: BorderRadius.circular(EdgesPorderRaduis),
            color: Comm_controller(context).isLight
                ? AppColor.GaryColorApp
                : ThemeText(context).titleMedium!.color!.withOpacity(0.15),
          ),
          height: 90.h,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(PadddingItems),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
                  child: Image.network(
                    IsCart ? Singlemodel!.image! : model!.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(PadddingItems),
                child: Container(
                  width: widthOfScreen(context) - 153.w,
                  height: 80.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Cust_text(
                          MaxLins: 1,
                          overflow: TextOverflow.ellipsis,
                          TeStyle: ThemeText(context).titleLarge!,
                          TextT: IsCart ? Singlemodel!.title! : model!.title),
                      Container(
                        constraints: BoxConstraints(maxWidth: 120.w),
                        child: Cust_text(
                            MaxLins: 1,
                            overflow: TextOverflow.ellipsis,
                            TeStyle: ThemeText(context).titleMedium!,
                            TextT:
                                IsCart ? Singlemodel!.desc! : model!.subtitle),
                      ),
                      Spacer(),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Cust_text(
                                MaxLins: 1,
                                overflow: TextOverflow.ellipsis,
                                TeStyle: ThemeText(context).titleLarge!,
                                TextT:
                                    "${IsCart ? Singlemodel!.price! : model!.price}\$"),
                            IsCart ? CounterQuintity() : ToggleFavorite(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
