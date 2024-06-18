import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/features/featsures/data/models/book_model.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/CRUD_books/crud_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/routers/routers.dart';
import '../../../../../../core/Methods/Navigator.dart';
import '../../../../../../core/utils/style/Sizes.dart';
import '../../../Components/C_Text.dart';
import '../../../blocs/controllers_cubits/Controllers_cubits.dart';

class BookItemone extends StatelessWidget {
  const BookItemone({
    super.key,
    this.model,
    this.FavoriteIndex,
  });
  final BookItem? model, FavoriteIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Comm_controller(context).isLight
                  ? AppColor.BlackAppColorWithOpacity.withOpacity(0.05)
                  : ThemeText(context).titleMedium!.color!.withOpacity(0.1),
              borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
          margin: EdgeInsets.only(right: 10.r),
          width: 200.w,
          height: 310.h,
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                home_controller(context)
                    .GetSingleBook(isbn13: model!.isbn13)
                    .then((value) => goToThisScreen(
                        context: context,
                        routeName: Routeing.detalis,
                        arguments: home_controller(context).Book));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Comm_controller(context).isLight
                          ? Colors.white
                          : ThemeText(context)
                              .titleMedium!
                              .color!
                              .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
                  margin: EdgeInsets.only(right: 10.r),
                  width: 175.w,
                  height: 220.h,
                  child: Image.network(model!.image),
                ),
              ),
            ),
            Container(
              width: 175.w,
              padding: EdgeInsets.only(top: 5.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Cust_text(
                              TeStyle: ThemeText(context)
                                  .headlineLarge!
                                  .copyWith(
                                      fontSize: 24.sp, color: Colors.lightBlue),
                              TextT: "${model!.price}"),
                          Text(" / E-book")
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          CrudBooks_controller(context).insertBooktoFav(model!);
                        },
                        child: BlocConsumer<CrudBooksCubit, CrudBooksState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.r),
                              child: Image.asset(
                                Assets.AddFavo,
                                width: 38.w,
                                color: CrudBooks_controller(context)
                                        .FavBooks
                                        .any((element) =>
                                            element!.isbn13 == model!.isbn13)
                                    ? AppColor.primaryColor
                                    : Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Cust_text(
                      TeStyle: ThemeText(context)
                          .titleLarge!
                          .copyWith(overflow: TextOverflow.ellipsis),
                      TextT: model!.title),
                  Cust_text(
                      TeStyle: ThemeText(context).titleSmall!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: ThemeText(context)
                              .titleMedium!
                              .color!
                              .withOpacity(0.2),
                          overflow: TextOverflow.ellipsis),
                      TextT: model!.subtitle)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
