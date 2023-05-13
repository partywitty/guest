// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../Modal/pdfReaderM.dart';

class pdf extends StatefulWidget {
  const pdf({Key? key}) : super(key: key);

  @override
  State<pdf> createState() => _pdfState();
}

class _pdfState extends State<pdf> {
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";
  List <PdfReaderData> PdfReaderdata=[];
  final Completer<PDFViewController> _controller =
  Completer<PDFViewController>();
  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    //print("Start download file from internet!");
    try {
      "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      const url = "https://pdfkit.org/docs/guide.pdf";
      // final url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      //print("Download files");
     // print("------dir path--------------------${dir.path}/$filename");
      File file = File("${dir.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }

  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  @override
  void initState() {
    load();
    super.initState();
  }
  load(){
    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
        width: double.infinity,
        child: PDF(
        swipeHorizontal: true,
        fitEachPage: true,
        autoSpacing: false,
        onPageChanged: (page,p)  {
          setState(() {
            //print('val----------$p-----------$page');
          });
        },
        enableSwipe: true).fromUrl('https://pdfkit.org/docs/guide.pdf',
          placeholder: (progress) => Center(
        child: Text("Loading - $progress %"),
      ),
      errorWidget: (error) => const Center(
        child: Text("An error occurred while opening bill PDF"),
      ),
      )));

  }
}
class ApiServiceProvider {
  var baseUrl = "https://www.ibm.com/downloads/cas/GJ5QVQ7X";

  static Future<String> loadPDF() async {
    final response = await get(Uri.parse('https://www.ibm.com/downloads/cas/GJ5QVQ7X'),
    );
    var dir = await getApplicationDocumentsDirectory();
    File file =  File("${dir.path}/data.pdf");
    //print('-file-------------file----------------$file');
    //print('-response-------------response----------------${response.body}');

    file.writeAsBytesSync(response.bodyBytes,);
    //print('-response-------------response----------------${file.path}');
    return file.path;
  }
}