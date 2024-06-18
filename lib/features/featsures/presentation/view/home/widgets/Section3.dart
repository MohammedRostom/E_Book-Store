import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Home_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/home/widgets/BookItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/style/Sizes.dart';
import '../../../blocs/controllers_cubits/Controllers_cubits.dart';

class Threesection extends StatelessWidget {
  const Threesection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: widthOfScreen(context),
          height: 310.h,
          child: home_controller(context).Isloding
              ? Center(child: Lottie.asset(Assets.bookloader, width: 80.w))
              : home_controller(context).BooksList.isEmpty
                  ? Center(child: Text("No Data"))
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              home_controller(context).BooksList.length,
                              (index) => BookItemone(
                                    model: home_controller(context)
                                        .BooksList[index],
                                  ))),
                    ),
        );
      },
    );
  }
}
