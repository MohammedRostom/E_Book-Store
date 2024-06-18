import 'package:flutter/material.dart';
import '../../../../core/utils/style/Sizes.dart';

class BodyOflayOutScreen extends StatelessWidget {
  const BodyOflayOutScreen({
    super.key,
    required this.BodyOflayOutChild,
  });

  final Widget BodyOflayOutChild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(Paddingscreen),
            width: widthOfScreen(context),
            height: HightOfScreen(context),
            child: BodyOflayOutChild,
          ),
        ));
  }
}
