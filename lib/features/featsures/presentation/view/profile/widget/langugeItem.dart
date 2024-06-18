import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Comm_cubit/comm_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class langugeItem extends StatelessWidget {
  const langugeItem({
    super.key,
    this.index,
  });
  final index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommCubit, CommState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Comm_controller(context).changeLanguage(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.all(5.r),
              child: Text(
                AppLanguages[index],
                style: index == Comm_controller(context).indexLanguageSelected
                    ? ThemeText(context)
                        .titleMedium!
                        .copyWith(color: AppColor.primaryColor, fontSize: 20.sp)
                    : ThemeText(context).titleMedium!,
              ),
            ),
          ),
        );
      },
    );
  }
}
