import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/Cubits/Home_cubit/home_cubit.dart';
import 'widgets/Homebody.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(resizeToAvoidBottomInset: false, body: HomeBody());
      },
    );
  }
}
