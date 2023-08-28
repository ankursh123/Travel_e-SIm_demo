import 'package:mvvm_demo_persatation_1/domain/repositories/esimRepo.dart';
import '../../data/models/eSimModel.dart';

class ESimUseCase {

  final ESim eSim;
  ESimUseCase(this.eSim);

  Future<List<ESimModel>> getData(){
    return eSim.getESimData();
  }

}