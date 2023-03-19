import 'package:briskon/provider/documents_provider.dart';
import 'package:briskon/utils.dart';
import 'package:briskon/view/pdf_view/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../webview/web_view.dart';

class CertificatesList extends StatefulWidget {
  const CertificatesList({Key? key}) : super(key: key);

  @override
  State<CertificatesList> createState() => _CertificatesListState();
}

class _CertificatesListState extends State<CertificatesList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DocumentsProvider>().getDocumentsByType(type: DocumentTypes.certificate);
    });

  }

  @override
  Widget build(BuildContext context) {

    final certificates = context.watch<DocumentsProvider>().certificates;

    return Scaffold(
      appBar: AppBar(
        title: Text("Certifications & Approvals"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: certificates.length,
          padding: EdgeInsets.all(10.sp),
          itemBuilder: (context, index) {

            final certificate = certificates[index];

          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewScreen(url: certificate.imageURL, title: certificate.title ?? ""),));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.sp,vertical: 8.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(2.5.sp,2.5.sp),
                    spreadRadius: 1
                  )
                ]
              ),
              padding: EdgeInsets.all(10.sp),
              child: Row(
                children: [
                  Icon(Icons.picture_as_pdf_rounded,color: kPrimaryColor,),
                  Expanded(child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Text(certificate.title ?? "",style: TextStyleConstant.textStyleFont500FontSize12),
                  )),
                  Icon(Icons.arrow_forward_ios_rounded,size: 15.sp)
                ],
              ),
            ),
          );
        },),
      ),
    );
  }
}
// https://rdso.indianrailways.gov.in/works/uploads/File/Hi%20-%20Tech%20certificate%20letter.pdf