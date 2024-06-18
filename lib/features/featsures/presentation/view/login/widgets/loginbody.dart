import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Auth_cubit/auth_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Home_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/login/widgets/loginform.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Components/Overlywidget.dart';
import '../../../blocs/controllers_cubits/Controllers_cubits.dart';

class loginbody extends StatelessWidget {
  loginbody({
    super.key,
    required this.State,
  });
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthState State;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(top: 50.r),
                child: SvgPicture.asset(
                  // ignore: deprecated_member_use
                  colorBlendMode: BlendMode.colorDodge,
                  Assets.login_illst,
                ),
              ),
            ),
            loginform(
                formKey: _formKey,
                emailController: emailController,
                passwordController: passwordController),
          ],
        ),
        State is Loadeing
            ? overlyWidget(
                BgColor: Comm_controller(context).isLight
                    ? Colors.white.withOpacity(0.8)
                    : Colors.black.withOpacity(0.8),
                LoaderLottieType: Assets.bookloader,
              )
            : Text("")
      ],
    );
  }
}
