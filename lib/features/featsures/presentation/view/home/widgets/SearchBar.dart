import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/const.dart';
import '../../../../../../core/utils/style/String.dart';
import '../../../../../../generated/l10n.dart';
import '../../../blocs/Cubits/Search_cubit/Search_cubit.dart';
import '../../../blocs/controllers_cubits/Controllers_cubits.dart';

class SearchBsar extends StatelessWidget {
  const SearchBsar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Search_cubit, Search_state>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return TextField(
          onSubmitted: (value) {
            Search_controller(context).SearchBooks(value, context);
          },
          decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.r),
                child: SvgPicture.asset(
                  Assets.Search,
                  color: AppColor.BlackAppColorWithOpacity,
                ),
              ),
              hintText: S.of(context).Search_ebook,
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.BlackAppColorWithOpacity.withOpacity(0.3)),
              border: InputBorder.none),
        );
      },
    );
  }
}
