import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dismissiblebackground extends StatelessWidget {
  const Dismissiblebackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Container(
          child: Icon(
            Icons.delete,
            size: WsvgIcon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.4),
              spreadRadius: 4,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
        ),
      ),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.blue, boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.8),
          spreadRadius: 6,
          blurRadius: 15,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
    );
  }
}
