import 'package:mvvm_demo_persatation_1/data/models/eSimModel.dart';

abstract class ESim {
  ///Must Override this function to get Global e-SIM Data.
  Future<List<ESimModel>> getESimData();
}
