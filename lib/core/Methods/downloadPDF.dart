import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<File> downloadPDF(String url) async {
  final response = await http.get(Uri.parse(url));
  final documentDirectory = await getApplicationDocumentsDirectory();
  final file = File('${documentDirectory.path}/example.pdf');
  await file.writeAsBytes(response.bodyBytes);
  return file;
}
