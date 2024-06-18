import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/routers/routers.dart';
import 'package:flutter_application_2/core/Methods/Navigator.dart';
import 'package:flutter_application_2/core/utils/const.dart';
import 'package:flutter_application_2/core/utils/style/Sizes.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/C_Text.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/Cust_TextForm.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Auth_cubit/auth_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/detalis/widgets/InfoSection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/controllers_cubits/Controllers_cubits.dart';

class Signupform extends StatelessWidget {
  const Signupform({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.UsernameController,
    required this.re_passwordController,
    required this.PhoneController,
    required this.RoleController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController UsernameController,
      emailController,
      passwordController,
      re_passwordController,
      PhoneController,
      RoleController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        flex: 4,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Cust_text(
                  TeStyle: ThemeText(context)
                      .headlineLarge!
                      .copyWith(fontSize: 32.sp),
                  TextT: "Sign up".toUpperCase(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Cust_TextForm(
                  controller: UsernameController,
                  labelText: "Username",
                  hintText: "Example45485",
                  prefixIcon: Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Username';
                    }
                  },
                ),
                Cust_TextForm(
                  inputype: TextInputType.emailAddress,
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
                  },
                ),
                Cust_TextForm(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "............",
                  prefixIcon: Icon(Icons.lock),
                  obscureText: true,
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
                  },
                ),
                Cust_TextForm(
                  controller: re_passwordController,
                  labelText: "Re_Password",
                  hintText: "............",
                  prefixIcon: Icon(Icons.lock),
                  obscureText: true,
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
                  },
                ),
                Cust_TextForm(
                  inputype: TextInputType.phone,
                  controller: PhoneController,
                  labelText: "Phone",
                  hintText: "+20",
                  prefixIcon: Icon(Icons.phone),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone';
                    }
                  },
                ),
                Cust_TextForm(
                  controller: RoleController,
                  labelText: "Role",
                  hintText: "php Developer",
                  prefixIcon: Icon(Icons.roller_shades),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Role';
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
