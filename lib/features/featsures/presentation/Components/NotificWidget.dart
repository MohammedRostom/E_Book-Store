import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificWidget extends StatelessWidget {
  const NotificWidget({
    super.key,
    required this.num,
  });
  final int num;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 10.r,
          backgroundColor:
              Comm_controller(context).isLight ? Colors.white : Colors.black,
        ),
        CircleAvatar(
          radius: 8.r,
          backgroundColor: Colors.blue,
          child: Text(
            "${num}",
            style: TextStyle(color: Colors.white, fontSize: 10.sp),
          ),
        ),
      ],
    );
  }
}
