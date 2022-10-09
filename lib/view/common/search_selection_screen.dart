import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

class SearchSelectionScreen extends StatefulWidget {
  const SearchSelectionScreen({Key? key,required this.searchList, required this.selectedObject}) : super(key: key);

  final List<SearchModel> searchList;

  final Function(SearchModel)? selectedObject;

  @override
  _SearchSelectionScreenState createState() => _SearchSelectionScreenState();
}

class _SearchSelectionScreenState extends State<SearchSelectionScreen> {

  List<SearchModel> searchList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      searchList = widget.searchList;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(

        leadingWidth: 44,
        title: Container(
          height: 44,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(44),
            boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: const Offset(0,1),
                  color: Colors.black.withOpacity(0.05)
                )
            ]
          ),
          child: TextField(
            autofocus: true,
            onChanged: (text){
              if(text.isEmpty){
                setState(() {
                  searchList = widget.searchList;
                });
                return;
              }else{
                setState(() {
                  searchList = widget.searchList.where((element) => (element.title ?? '').toLowerCase().contains(text.toLowerCase())).toList();
                });
              }
            },
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {

          return ListTile(
            title: Text('${searchList[index].title}',style: TextStyle(
                // fontSize: kRegularFontSize,
                fontWeight: FontWeight.w600
            ),),
            onTap: (){
              if (widget.selectedObject != null){
                widget.selectedObject!(searchList[index]);
              }
              Navigator.of(context).pop();
            },
          );

        },),
    );
  }
}

class SearchModel{
  int? id;
  String? title;

  SearchModel({this.id,this.title});

}

void callSearchList({required BuildContext context, required List<SearchModel> searchList, required Function(SearchModel)? selectedObject}){

  final searchScreen = SearchSelectionScreen(searchList: searchList, selectedObject: selectedObject);

  Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchScreen,fullscreenDialog: true));

}

class SearchList extends StatelessWidget {
  const SearchList({Key? key,required this.searchList, required this.selectedObject,this.title,required this.hint, this.prefix}) : super(key: key);

  final List<SearchModel> searchList;

  final Function(SearchModel)? selectedObject;

  final String? title;

  final String hint;

  final Widget? prefix;

  @override
  Widget build(BuildContext context) {

    final enabled = searchList.isNotEmpty;

    return InkWell(
      onTap: () {
        if(!enabled){return;}
        final searchScreen = SearchSelectionScreen(searchList: searchList, selectedObject: selectedObject);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchScreen,fullscreenDialog: true));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffE5E5E5))
        ),
        child: Row(
          children: [

            if(prefix != null)
            Row(
              children: [
                SizedBox(width: 15.sp),
                prefix!
              ],
            ),

            Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Text(title ?? hint,style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: title == null ? const Color(0xffAFAFAF) : Colors.black,
              ),),
            )),
            Container(
              margin: EdgeInsets.all(5.sp),
              child: Icon(Icons.arrow_drop_down_rounded,color:enabled ? kPrimaryColor : Colors.grey,size: 30.sp),
            )
          ],
        ),
      ),
    );

    return InkWell(
      onTap: (){
        if(!enabled){return;}
        final searchScreen = SearchSelectionScreen(searchList: searchList, selectedObject: selectedObject);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => searchScreen,fullscreenDialog: true));
      },
      child: Container(
          height: 45.sp,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // boxShadow: kCommonShadow,
          ),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp),
                      child: Text(
                        title ?? hint,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            // fontSize: kRegularFontSizegularFontSize,
                            color: enabled ? Colors.black : Colors.grey
                        ),
                      ))),
              Container(
                margin: EdgeInsets.all(10.sp),
                child: Icon(Icons.arrow_drop_down,color:enabled ? Colors.black : Colors.grey,size: 30.sp),
              )
            ],
          )),
    );
  }
}
