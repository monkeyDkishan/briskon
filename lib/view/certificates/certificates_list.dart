import 'package:briskon/utils.dart';
import 'package:briskon/view/pdf_view/pdf_view.dart';
import 'package:flutter/material.dart';

class CertificatesList extends StatelessWidget {
  const CertificatesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Certifications & Approvals"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 4,
          padding: EdgeInsets.all(10.sp),
          itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PDFViewer(asset: "assets/files/dummy_iso_certy.pdf", title: "ISO 9001:2015"),));
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
                    child: Text("ISO 9001:2015",style: TextStyleConstant.textStyleFont500FontSize12),
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