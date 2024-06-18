import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/const.dart';
import '../../../../../../core/utils/style/Sizes.dart';
import '../../../Components/ItemBtnNav.dart';
import '../../../blocs/Cubits/Comm_cubit/comm_cubit.dart';

class CustbottomBar extends StatelessWidget {
  const CustbottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 4.r),
      child: BlocConsumer<CommCubit, CommState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
                color: AppTheme(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(EdgesPorderRaduis)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    ItemNavga(context).length,
                    (index) => ItemBtnNav(
                          T_Lebal: ItemNavga(context)[index][T_Lebal]!,
                          icon: ItemNavga(context)[index][IconPath]!,
                          index: index,
                        ))),
          );
        },
      ),
    );
  }
}
