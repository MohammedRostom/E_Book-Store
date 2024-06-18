import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/CRUD_books/crud_books_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/style/Sizes.dart';

class ItemBtnNav extends StatelessWidget {
  const ItemBtnNav({
    super.key,
    required this.index,
    required this.icon,
    required this.T_Lebal,
  });
  final int index;
  final String icon;
  final String T_Lebal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Comm_controller(context).ChangeIndex(index),
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.r, top: 4.r),
        child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 17.r, vertical: 2.r),
          decoration: BoxDecoration(
              color: Comm_controller(context).SelectedIndex == index
                  ? ThemeText(context).titleMedium!.color!.withOpacity(0.14)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
          child: Row(children: [
            BlocConsumer<CrudBooksCubit, CrudBooksState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    SvgPicture.asset(
                      icon,
                      width: WsvgIcon,
                      color: Comm_controller(context).SelectedIndex == index
                          ? AppColor.primaryColor
                          : ThemeText(context)
                              .titleMedium!
                              .color!
                              .withOpacity(0.5),
                    ),
                    index == 1 &&
                                CrudBooks_controller(context)
                                    .FavBooks
                                    .isNotEmpty ||
                            index == 2 &&
                                CrudBooks_controller(context)
                                    .CartBooks
                                    .isNotEmpty
                        ? CircleAvatar(
                            radius: 4.5.r,
                            backgroundColor: Colors.red,
                          )
                        : Text("")
                  ],
                );
              },
            ),
            Text(
              Comm_controller(context).SelectedIndex == index
                  ? " $T_Lebal"
                  : "",
              style: ThemeText(context)
                  .titleSmall!
                  .copyWith(color: AppColor.primaryColor),
            )
          ]),
        ),
      ),
    );
  }
}
