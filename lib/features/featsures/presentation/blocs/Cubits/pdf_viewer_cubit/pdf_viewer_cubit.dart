import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/routers/routers.dart';
import 'package:flutter_application_2/core/Methods/Navigator.dart';
import 'package:flutter_application_2/core/Methods/downloadPDF.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'pdf_viewer_state.dart';

class PdfViewerCubit extends Cubit<PdfViewerState> {
  PdfViewerCubit() : super(PdfViewerInitial());
  static PdfViewerCubit get(context) => BlocProvider.of(context);

  bool loading = false;
  void launchPDF(String? url, BuildContext context) async {
    loading = true;
    emit(PdfViewerloading());
    try {
      final pdfFile = await downloadPDF(url!);
      goToThisScreen(
        context: context,
        routeName: Routeing.PdfV,
        arguments: pdfFile.path,
      );
      loading = false;
      emit(PdfViewerDone());
    } catch (e) {
      loading = false;
      emit(PdfViewererror());
    }
  }
}
