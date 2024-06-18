import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/profile_photo_cubit_cubit/profile_photo_cubit_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Cashe/Cache.dart';

class PickImageZone extends StatelessWidget {
  PickImageZone({super.key, required this.state});
  ProfilePhotoCubitState state;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Photo_Controller(context).uploadImageAndGetURL(
          Uid: PreferencesService.getUserName("uid")!, context: context),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: 95.w,
        height: 85.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(70.r)),
        child: state is ProfilePhotoLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              )
            : Image.network(
                fit: BoxFit.cover,
                PreferencesService.getUserName(ImagePathkey) == null
                    ? URls.DefalutProfileImge
                    : PreferencesService.getUserName(ImagePathkey)!),
      ),
    );
  }
}
