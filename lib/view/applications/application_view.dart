import 'package:briskon/provider/documents_provider.dart';
import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationView extends StatefulWidget {
  ApplicationView({Key? key}) : super(key: key);

  @override
  State<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DocumentsProvider>().getDocumentsByType(type: DocumentTypes.application);
    });

  }


  @override
  Widget build(BuildContext context) {

    final applications = context.watch<DocumentsProvider>().applications;

    return Scaffold(
      appBar: AppBar(title: const Text("Applications"),),
      body: ListView.builder(itemBuilder: (context, index) {

        final application = applications[index];

        return AspectRatio(
          aspectRatio: 1.5,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(application.imageURL,fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        // Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.5)
                          ])
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 10.sp),
                    child: Text(application.title ?? "",style: TextStyleConstant.textStyleFont500FontSize15,),
                  ))
            ],
          ),
        );

      },itemCount: applications.length,),
    );
  }
}
