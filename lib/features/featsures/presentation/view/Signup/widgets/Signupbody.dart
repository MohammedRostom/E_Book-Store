import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/features/featsures/data/models/user_model.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/Signup/widgets/Signupform.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../config/routers/routers.dart';
import '../../../../../../core/Methods/Navigator.dart';
import '../../../Components/C_Text.dart';
import '../../../Components/Overlywidget.dart';
import '../../../blocs/Cubits/Auth_cubit/auth_cubit.dart';
import '../../detalis/widgets/InfoSection.dart';

class Signupbody extends StatelessWidget {
  Signupbody({
    super.key,
  });
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController re_pass = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController role = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: Paddingscreen),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(top: 50.r),
                      child: SvgPicture.asset(
                        // ignore: deprecated_member_use
                        colorBlendMode: BlendMode.colorDodge,
                        Assets.Signup_illst,
                      ),
                    ),
                  ),
                  Signupform(
                      formKey: _formKey,
                      emailController: email,
                      UsernameController: username,
                      re_passwordController: re_pass,
                      PhoneController: phone,
                      RoleController: role,
                      passwordController: pass),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustBtn(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        UserModel newuser = UserModel(
                            UserName: username.text,
                            Role: role.text,
                            Email: email.text,
                            Password: pass.text,
                            Re_Password: re_pass.text,
                            Phone: phone.text);

                        Auth_controller(context)
                            .AddNewUser(User: newuser, context: context);
                        // Perform login action here
                      }
                    },
                    textBtn: "Sign up",
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        goToThisScreen(
                            context: context, routeName: Routeing.Login);
                      },
                      child: Cust_text(
                        TeStyle: ThemeText(context)
                            .headlineLarge!
                            .copyWith(fontSize: 20.sp),
                        TextT: "Login",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
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
      },
    );
  }
}
