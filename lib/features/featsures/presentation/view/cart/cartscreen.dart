import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/Methods/Navigator.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/String.dart';
import 'package:flutter_application_2/features/featsures/data/data_sources/local/databsesTables.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/BodyOflayOutScreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/CustomAppbarAllscreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/CRUD_books/crud_books_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/style/Colors.dart';
import '../../../../../generated/l10n.dart';
import '../../Components/IteamFavOrCart.dart';
import '../../Components/NotificWidget.dart';
import '../detalis/widgets/InfoSection.dart';

class Carts extends StatelessWidget {
  const Carts({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyOflayOutScreen(
        BodyOflayOutChild: BlocConsumer<CrudBooksCubit, CrudBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          CustomAppbarAllscreen(
            MakeSpacerBetweenTwoElement: true,
            visibleLeftIcon: false,
            onTapLeftIcon: () => backFromContext(context),
            CenterText: S.of(context).My_cart,
            RightIcon: Assets.Cart,
            Notific: CrudBooks_controller(context).CartBooks.isEmpty
                ? null
                : NotificWidget(
                    num: CrudBooks_controller(context).CartBooks.length,
                  ),
          ),
          Expanded(
            flex: 50,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    CrudBooks_controller(context).CartBooks.length,
                    (index) => IteamFavOrCart(
                          onDismissed: (p0) {
                            CrudBooks_controller(context).RemoveItem(
                                Id: CrudBooks_controller(context)
                                    .CartBooks[index]!
                                    .toJson()["id"],
                                TableName: CartTable);
                          },
                          Singlemodel:
                              CrudBooks_controller(context).CartBooks[index]!,
                          IsCart: true,
                        )),
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Cust_text(
                        TeStyle: ThemeText(context).titleMedium!.copyWith(
                              fontSize: 14.sp,
                            ),
                        TextT: S.of(context).Total_Price),
                    Cust_text(
                        TeStyle: ThemeText(context).headlineLarge!.copyWith(
                            fontSize: 40.sp, color: AppColor.primaryColor),
                        TextT:
                            "${CrudBooks_controller(context).getTotalPrice(CrudBooks_controller(context).CartBooks).toStringAsFixed(2)}\$")
                  ],
                ),
              ),
              CustBtn(
                textBtn: S.of(context).Cheackout,
              ),
            ],
          )
        ]);
      },
    ));
  }
}
