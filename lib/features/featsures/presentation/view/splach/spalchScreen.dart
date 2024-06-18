import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Comm_cubit/comm_cubit.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/controllers_cubits/Controllers_cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/routers/routers.dart';

class startScreen extends StatefulWidget {
  const startScreen({super.key});
  @override
  State<startScreen> createState() => _startScreenState();
}

class _startScreenState extends State<startScreen> {
  @override
  void initState() {
    MoveFromStartStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<CommCubit, CommState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container(
                padding: EdgeInsets.all(100.r),
                child: Image.asset(Comm_controller(context).isLight
                    ? Assets.logolight
                    : Assets.logodark));
          },
        ),
      ),
    );
  }

  MoveFromStartStatus() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushNamed(context, Routeing.Layout);
  }
}
