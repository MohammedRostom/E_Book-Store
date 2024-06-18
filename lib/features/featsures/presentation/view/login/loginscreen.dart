import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Auth_cubit/auth_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/login/widgets/loginbody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginS extends StatelessWidget {
  LoginS({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: loginbody(State: state),
        );
      },
    );
  }
}
