import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/CustomAppbarAllscreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/profile_photo_cubit_cubit/profile_photo_cubit_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/widget/FristSection.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/widget/Section2.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/profile/widget/Section3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../Components/BodyOflayOutScreen.dart';

class ProfileS extends StatelessWidget {
  const ProfileS({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilePhotoCubit, ProfilePhotoCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BodyOflayOutScreen(
            BodyOflayOutChild: Column(
          children: [
            CustomAppbarAllscreen(
              MakeSpacerBetweenTwoElement: true,
              RightIcon: Assets.Profile,
              CenterText: S.of(context).ProfileT,
              visibleLeftIcon: false,
            ),
            FristSection(
              state: state,
            ),
            Section2(),
            section3(),
          ],
        ));
      },
    );
  }
}
