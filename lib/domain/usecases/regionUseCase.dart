import 'package:mvvm_demo_persatation_1/domain/repositories/regionRepo.dart';
import '../../data/models/regionModel.dart';

class RegionUseCase {

  final Region region;
  RegionUseCase(this.region);

  Future<List<RegionModel>> getData() {
    return region.getRegionData();
  }

}