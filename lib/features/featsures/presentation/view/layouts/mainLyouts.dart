import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/Comm_cubit/comm_cubit.dart';
import '../../../../../core/utils/const.dart';
import '../../blocs/controllers_cubits/Controllers_cubits.dart';
import 'Widgets/CustbottomBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class layouts extends StatelessWidget {
  const layouts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommCubit, CommState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Screens[Comm_controller(context).SelectedIndex],
            bottomNavigationBar: CustbottomBar());
      },
    );
  }
}
