import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/featsures/presentation/blocs/Cubits/pdf_viewer_cubit/pdf_viewer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../../../../core/Methods/modelRoute.dart';

class PdfViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String PdfPath = Argument(context) as String;
    return BlocConsumer<PdfViewerCubit, PdfViewerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('PDF Viewer'),
          ),
          body: PDFView(
            filePath: PdfPath,
          ),
        );
      },
    );
  }
}
