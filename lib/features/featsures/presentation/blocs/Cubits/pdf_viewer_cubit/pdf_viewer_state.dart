part of 'pdf_viewer_cubit.dart';

@immutable
sealed class PdfViewerState {}

final class PdfViewerInitial extends PdfViewerState {}

final class PdfViewerloading extends PdfViewerState {}

final class PdfViewerDone extends PdfViewerState {}

final class PdfViewererror extends PdfViewerState {}
