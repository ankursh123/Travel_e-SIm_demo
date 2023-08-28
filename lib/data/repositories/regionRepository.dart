import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/repositories/regionRepo.dart';
import '../models/regionModel.dart';

/// Created by Appinventiv  on [16-Aug-2023].
class RegionRepository extends Region{

  ///Loading and returning JSON data of Region.
  @override
  Future<List<RegionModel>> getRegionData() async {
    RegionModel regionModel = RegionModel();
    var data = await rootBundle.loadString("assets/file/region_list.json");
    List jsonData = json.decode(data);
    return regionModel.fromJson(jsonData);
  }

}