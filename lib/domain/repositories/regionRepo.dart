import '../../data/models/regionModel.dart';

abstract class Region {

  ///Must Override this function to get Region Data.
  Future<List<RegionModel>> getRegionData();

}