//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'Styles.dart';
//
//
// class PDFViewerPage extends StatefulWidget {
//   final File file;
//   final String title;
//
//   const PDFViewerPage({
//     Key? key,
//     required this.file,
//     required this.title
//   }) : super(key: key);
//
//   @override
//   _PDFViewerPageState createState() => _PDFViewerPageState();
// }
//
// class _PDFViewerPageState extends State<PDFViewerPage> {
//   PDFViewController? controller;
//   int pages = 0;
//   int indexPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final text = '${indexPage + 1} of $pages';
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appColor,
//         // elevation: 0,
//         title: Text(widget.title.toString(),style: appBarText),
//         actions: pages >= 2
//             ? [
//           Center(child: Text(text)),
//           IconButton(
//             icon: const Icon(Icons.chevron_left, size: 32),
//             onPressed: () {
//               final page = indexPage == 0 ? pages : indexPage - 1;
//               controller!.setPage(page);
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.chevron_right, size: 32),
//             onPressed: () {
//               final page = indexPage == pages - 1 ? 0 : indexPage + 1;
//               controller!.setPage(page);
//             },
//           ),
//         ]
//             : null,
//       ),
//       body: PDFView(
//         filePath: widget.file.path,
//         // autoSpacing: false,
//         // swipeHorizontal: true,
//         // pageSnap: false,
//         // pageFling: false,
//         onRender: (pages) => setState(() => this.pages = pages!),
//         onViewCreated: (controller) =>
//             setState(() => this.controller = controller),
//         onPageChanged: (indexPage, _) =>
//             setState(() => this.indexPage = indexPage!),
//       ),
//     );
//   }
// }