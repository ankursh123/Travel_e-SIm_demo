import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mvvm_demo_persatation_1/domain/repositories/countryRepo.dart';
import '../models/countryModel.dart';

/// Created by Appinventiv  on [16-Aug-2023].
class CountryRepository extends Country {

  ///Loading and returning JSON data of Country.
  @override
  Future<List<CountryModel>> getCountryData() async{
    CountryModel countryModel = CountryModel();
    var data = await rootBundle.loadString("assets/file/country_list.json");
    List jsonData = json.decode(data);
    return countryModel.fromJson(jsonData);
  }

}