import 'dart:convert';

import 'package:briskon/utils.dart';
import 'package:flutter/material.dart';

import '../../../model/location/country.dart';
import '../../common/search_selection_screen.dart';

class AddEnquiryLocationPicker extends StatefulWidget {
   AddEnquiryLocationPicker({Key? key, required this.onCity, required this.onState, this.selectedState, this.selectedCity}) : super(key: key);

   String? selectedState = "Gujarat";

   String? selectedCity = "Ahmedabad";

   final Function(String) onCity;
   final Function(String) onState;

  @override
  State<AddEnquiryLocationPicker> createState() => _AddEnquiryLocationPickerState();
}

class _AddEnquiryLocationPickerState extends State<AddEnquiryLocationPicker> {

  get selectedState => widget.selectedState;
  get selectedCity => widget.selectedCity;

  List<SearchModel>? getStates({String? jsonString}) {
    final json = jsonDecode(jsonString ?? "");

    final countries = ResCountries.fromJson(json).countries;

    final myCountry = countries?.where((element) => element.country == "India");

    final cool = myCountry?.map((e) {
      return e.state;
    }).toSet();

    final list = cool?.toList().map((e) => SearchModel(title: e)).toList();

    return list;
  }

  List<SearchModel>? cityList({String? jsonString}){
    try {

      final json = jsonDecode(jsonString ?? "");

      final countries = ResCountries.fromJson(json).countries;

      final myState = countries?.where((element) => element.state == selectedState).toList();

      final cool = myState?.map((e) {
        return e.city;
      }).toSet();

      final list = cool?.toList().map((e) => SearchModel(title: e)).toList();
      return list;
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<String>(builder: (context, snapshot) {

      if(snapshot.hasData) {

        final states = getStates(jsonString: snapshot.data);
        final cities = cityList(jsonString: snapshot.data);

        return Column(
          children: [

            SearchListForEnquiry(searchList: states ?? [], selectedObject: (value){
              setState(() {
                widget.selectedState = value.title ?? "Gujarat";
                widget.selectedCity = null;
              });
            }, hint: "State",title: selectedState,prefix: Assets.locationMarkIcon(width: 20.sp, height: 20),),

            SizedBox(height: 12.sp),

            SearchListForEnquiry(searchList: cities ?? [], selectedObject: (value){
              setState(() {
                widget.selectedCity = value.title ?? "Ahmedabad";
              });
            }, hint: "City",title: selectedCity,prefix: Assets.locationMarkIcon(width: 20.sp, height: 20),),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }



    },future: loadAsset());

    return Container(
      padding: EdgeInsets.only(top: 10.sp,bottom: 5.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.sp),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff8A959E).withOpacity(0.1),
              offset: Offset(0,2.sp),
              blurRadius: 40,
            )
          ]
      ),

    );
  }
}

class SearchListForEnquiry extends StatelessWidget {
  const SearchListForEnquiry({Key? key,required this.searchList, required this.selectedObject,this.title,required this.hint, this.prefix}) : super(key: key);

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
        padding: EdgeInsets.only(top: 10.sp,bottom: 5.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.sp),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff8A959E).withOpacity(0.1),
                offset: Offset(0,2.sp),
                blurRadius: 40,
              )
            ],
        ),
        child: Row(
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hint,style: TextStyleConstant.textStyleFont400FontSize12.copyWith(
                      color: const Color(0xff808080),
                    ),),
                    SizedBox(height: 8.sp),
                    Text(title ?? hint,style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: title == null ? const Color(0xffAFAFAF) : Colors.black,
                    ),),
                  ],
                ),
              )),
              Container(
                margin: EdgeInsets.all(5.sp),
                child: Icon(Icons.arrow_drop_down_rounded,color:enabled ? kPrimaryColor : Colors.grey,size: 30.sp),
              )
            ],
          ),
      ),
      // child: Container(
      //   decoration: BoxDecoration(
      //       color: const Color(0xffFAFAFA),
      //       borderRadius: BorderRadius.circular(10),
      //       border: Border.all(color: Color(0xffE5E5E5))
      //   ),
      //   child: Row(
      //     children: [
      //
      //       if(prefix != null)
      //         Row(
      //           children: [
      //             SizedBox(width: 15.sp),
      //             prefix!
      //           ],
      //         ),
      //
      //       Expanded(child: Container(
      //         padding: EdgeInsets.symmetric(horizontal: 10.sp),
      //         child: Text(title ?? hint,style: TextStyle(
      //           fontSize: 14.sp,
      //           fontWeight: FontWeight.w400,
      //           color: title == null ? const Color(0xffAFAFAF) : Colors.black,
      //         ),),
      //       )),
      //       Container(
      //         margin: EdgeInsets.all(5.sp),
      //         child: Icon(Icons.arrow_drop_down_rounded,color:enabled ? kPrimaryColor : Colors.grey,size: 30.sp),
      //       )
      //     ],
      //   ),
      // ),
    );

  }
}