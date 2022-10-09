import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PDFViewer extends StatefulWidget {
  const PDFViewer({Key? key, required this.asset, required this.title}) : super(key: key);

  final String asset;
  final String title;

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {

  late final PdfControllerPinch pdfController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset(widget.asset),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PdfViewPinch(
        controller: pdfController,
      ),
    );
  }
}
