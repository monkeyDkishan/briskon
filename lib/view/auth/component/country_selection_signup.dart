import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../model/location/country.dart';
import '../../../utils.dart';
import '../../common/search_selection_screen.dart';

class CountryAndCitySelectionSignup extends StatefulWidget {
  const CountryAndCitySelectionSignup({Key? key}) : super(key: key);

  @override
  State<CountryAndCitySelectionSignup> createState() => _CountryAndCitySelectionSignupState();
}

class _CountryAndCitySelectionSignupState extends State<CountryAndCitySelectionSignup> {

  String? selectedState = "Gujarat";
  String? selectedCity = "Ahmedabad";

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
            SearchList(searchList: states ?? [], selectedObject: (value){
              setState(() {
                selectedState = value.title ?? "Gujarat";
                selectedCity = null;
              });
            }, hint: "State",title: selectedState,prefix: Assets.locationMarkIcon(width: 20.sp, height: 20),),

            SizedBox(height: 1.h),

            SearchList(searchList: cities ?? [], selectedObject: (value){
              setState(() {
                selectedCity = value.title ?? "Ahmedabad";
              });
            }, hint: "City",title: selectedCity,prefix: Assets.locationMarkIcon(width: 20.sp, height: 20),),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }



    },future: loadAsset());
  }
}