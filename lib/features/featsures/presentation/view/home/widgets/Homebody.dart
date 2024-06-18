import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/assets.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/BodyOflayOutScreen.dart';
import 'package:flutter_application_2/features/featsures/presentation/view/home/widgets/centerText.dart';

import '../../../Components/Overlywidget.dart';
import '../../../blocs/controllers_cubits/Controllers_cubits.dart';
import 'Section3.dart';
import 'section2.dart';
import 'section1.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const BodyOflayOutScreen(
              BodyOflayOutChild: Column(children: [
            Fristsection(),
            secondsection(),
            CenterText(),
            Threesection(),
          ])),
          home_controller(context).IslodingSingleBook
              ? overlyWidget(
                  BgColor: Comm_controller(context).isLight
                      ? Colors.white.withOpacity(0.8)
                      : Colors.black.withOpacity(0.8),
                  LoaderLottieType: Assets.bookloader,
                )
              : Text("")
        ],
      ),
    );
  }
}
