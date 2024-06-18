import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/features/featsures/data/models/single_booktModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/controllers_cubits/Controllers_cubits.dart';

class DemoBtn extends StatelessWidget {
  const DemoBtn({
    super.key,
    required this.Url,
  });

  final single_booktModel Url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: Url.pdf?.chapter2 != null || Url.pdf?.chapter5 != null
          ? () {
              Pdf_controller(context)
                  .launchPDF(Url.pdf?.chapter2 ?? Url.pdf?.chapter5, context);
            }
          : null,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 70.w,
            height: 20.h,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors:
                        Url.pdf?.chapter2 != null || Url.pdf?.chapter5 != null
                            ? [
                                AppColor.primaryColor,
                                Color.fromARGB(255, 181, 0, 197)
                              ]
                            : [
                                Color.fromARGB(255, 153, 153, 153),
                                Color.fromARGB(255, 155, 155, 155)
                              ]),
                borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.link_rounded,
                  size: 14,
                  color: Colors.white,
                ),
                Text(
                  "Demo",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
