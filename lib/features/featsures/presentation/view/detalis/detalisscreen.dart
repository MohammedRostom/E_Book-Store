import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/featsures/presentation/Components/Overlywidget.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/pdf_viewer_cubit/pdf_viewer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets.dart';
import '../../../data/models/single_booktModel.dart';
import '../../blocs/controllers_cubits/Controllers_cubits.dart';
import 'widgets/DetalisBody.dart';

class detaliss extends StatelessWidget {
  const detaliss({super.key});
  @override
  Widget build(BuildContext context) {
    single_booktModel Model =
        ModalRoute.of(context)!.settings.arguments as single_booktModel;
    return BlocConsumer<PdfViewerCubit, PdfViewerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(body: DetalisBody(Model: Model)),
            Pdf_controller(context).loading
                ? overlyWidget(
                    LoaderLottieType: Assets.pdfLoader,
                    WidthOfLoader: 140.r,
                  )
                : Text("")
          ],
        );
      },
    );
  }
}
