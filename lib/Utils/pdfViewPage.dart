// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:partywitty_guest/Utils/viewPdf.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
//
//
// class PdfView{
//   static openPDF(BuildContext context, File file,title) => Navigator.of(context).push(
//     MaterialPageRoute(builder: (context) => PDFViewerPage(file: file,title: title,)),
//   );
//
//   static Future<File> loadNetwork(String url) async {
//     final response = await http.get(Uri.parse(url));
//     final bytes = response.bodyBytes;
//     return _storeFile(url, bytes);
//   }
//
//   static Future<File> _storeFile(String url, List<int> bytes) async {
//     final filename = basename(url);
//     final dir = await getApplicationDocumentsDirectory();
//
//     final file = File('${dir.path}/$filename');
//     await file.writeAsBytes(bytes, flush: true);
//     return file;
//   }
// }