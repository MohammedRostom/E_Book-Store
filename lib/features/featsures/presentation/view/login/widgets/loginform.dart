import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/routers/routers.dart';
import 'package:flutter_application_2/core/Methods/Navigator.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/Cust_TextForm.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Auth_cubit/auth_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/detalis/widgets/InfoSection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class loginform extends StatelessWidget {
  const loginform({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        flex: 4,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Paddingscreen),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Cust_text(
                  TeStyle: ThemeText(context)
                      .headlineLarge!
                      .copyWith(fontSize: 32.sp),
                  TextT: "LOGIN",
                ),
                SizedBox(
                  height: 10.h,
                ),
                Cust_TextForm(
                  controller: emailController,
                  labelText: "Email",
                  hintText: "Example454@gmial.com",
                  prefixIcon: Icon(Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                Cust_TextForm(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "............",
                  prefixIcon: Icon(Icons.lock),
                  obscureText: Auth_controller(context).Showpass ? true : false,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                        onTap: () {
                          print("object");
                          Auth_controller(context).toogleVisblePassword();
                        },
                        child: Icon(Auth_controller(context).Showpass
                            ? Icons.remove_red_eye_rounded
                            : Icons.remove_red_eye_outlined)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustBtn(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Auth_controller(context).Login(
                          context: context,
                          User: emailController.text,
                          Pass: passwordController.text);
                      // Perform login action here
                    }
                  },
                  textBtn: "Login",
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
                          context: context, routeName: Routeing.Sginup);
                    },
                    child: Cust_text(
                      TeStyle: ThemeText(context)
                          .headlineLarge!
                          .copyWith(fontSize: 20.sp),
                      TextT: " Sign up",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
