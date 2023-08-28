import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/repositories/esimRepo.dart';
import '../models/eSimModel.dart';

/// Created by Appinventiv  on [17-Aug-2023].
class ESimRepository extends ESim{

  ///Loading and returning JSON data of Global e-SIM.
  @override
  Future<List<ESimModel>> getESimData() async {
    ESimModel eSim = ESimModel();
    var data = await rootBundle.loadString("assets/file/sim_data.json");
    List jsonData = json.decode(data);
    return eSim.fromJSON(jsonData);
  }

}