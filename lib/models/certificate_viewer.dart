// import 'package:flutter/material.dart';
// import 'package:pdfx/pdfx.dart';

// class CertificateViewer extends StatefulWidget {
//   final String assetPath;
//   final String title;

//   const CertificateViewer({
//     super.key,
//     required this.assetPath,
//     required this.title,
//   });

//   @override
//   State<CertificateViewer> createState() => _CertificateViewerState();
// }

// class _CertificateViewerState extends State<CertificateViewer> {
//   static const int _initialPage = 1;
//   late PdfController _pdfController;

//   @override
//   void initState() {
//     _pdfController = PdfController(
//       document: PdfDocument.openAsset(widget.assetPath),
//       initialPage: _initialPage,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: PdfView(
//         scrollDirection: Axis.vertical,
//         builders: PdfViewBuilders<DefaultBuilderOptions>(
//           options: DefaultBuilderOptions(),
//           documentLoaderBuilder: (_) =>
//               Center(child: CircularProgressIndicator()),
//           pageLoaderBuilder: (_) => Center(child: CircularProgressIndicator()),
//           pageBuilder: _pageBuilder,
//         ),
//         controller: _pdfController,
//       ),
//     );
//   }
// }

// PhotoViewGalleryPageOptions _pageBuilder(
//   BuildContext context,
//   Future<PdfPageImage> pageImage,
//   int index,
//   PdfDocument document,
// ) {
//   return PhotoViewGalleryPageOptions(
//     imageProvider: PdfPageImageProvider(pageImage, index, document.id),
//     minScale: PhotoViewComputedScale.contained * 1,
//     maxScale: PhotoViewComputedScale.contained * 2,
//     initialScale: PhotoViewComputedScale.contained * 1.0,
//     heroAttributes: PhotoViewHeroAttributes(tag: '${document.id}.$index'),
//   );
// }
