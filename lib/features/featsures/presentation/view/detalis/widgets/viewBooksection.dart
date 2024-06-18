import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/features/featsures/data/models/single_booktModel.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/detalis/widgets/DemoBtn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class viewBooksection extends StatelessWidget {
  const viewBooksection({
    super.key,
    required this.Model,
  });

  final single_booktModel Model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: Image.network(
                    Model.image!,
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 15,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(5.r),
              width: widthOfScreen(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Cust_text(
                          TeStyle: ThemeText(context).headlineLarge!,
                          TextT: "(${Model.rating!})"),
                      Container(
                        width: 200.w,
                        height: 25.h,
                        child: Row(
                          children: List.generate(
                              int.parse(Model.rating!),
                              (index) => Icon(
                                    Icons.star,
                                    size: 24.w,
                                    color: Colors.yellow,
                                  )),
                        ),
                      )
                    ],
                  ),
                  DemoBtn(Url: Model),
                ],
              ),
            )
          ],
        ));
  }
}
