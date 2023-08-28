import 'package:get/get.dart';
import 'package:mvvm_demo_persatation_1/domain/usecases/countryUsecase.dart';
import 'package:mvvm_demo_persatation_1/domain/usecases/eSimUseCase.dart';
import 'package:mvvm_demo_persatation_1/domain/usecases/regionUseCase.dart';
import '../../../app/config/extensions.dart';
import '../../../data/models/countryModel.dart';
import '../../../data/models/eSimModel.dart';
import '../../../data/models/regionModel.dart';
import '../../../data/repositories/countryRepository.dart';
import '../../../data/repositories/esimRepository.dart';
import '../../../data/repositories/regionRepository.dart';


/// Created by Appinventiv  on [16-Aug-2023].
class HomeViewModel extends GetxController {

  var countryList = <CountryModel>[].obs;
  var regionList = <RegionModel>[].obs;

  List<ESimModel> simDATA = [];
  RxBool isDataLoaded = false.obs;
  RxBool showCallsAndText = false.obs;
  ESimRepository globalESim = ESimRepository();
  CountryRepository countryRepo = CountryRepository();
  late CountryUseCase countryUseCase;
  late ESimUseCase eSimUseCase;
  late RegionUseCase regionUseCase;
  RegionRepository regionRepository = RegionRepository();
  ESimModel eSimData = ESimModel();

  void loadInitialData() {
    getEsimData();
    getCountryList();
    getRegionList();
    isDataLoaded.value = true;
  }

  ///Decoding and Loading Global-ESim Data from JSON.
  void getEsimData() async {
    eSimUseCase = ESimUseCase(globalESim);
    simDATA = await eSimUseCase.getData();
  }

  ///Decoding and Loading Couontry List from JSON.
  void getCountryList() async{
    countryUseCase = CountryUseCase(countryRepo);
    try {
      countryList.value = await countryUseCase.getData();
    } catch (error) {
      appLogPrint("Error $error");
    }
  }

  ///Decoding and Loading Region List from JSON.
  void getRegionList() async{
    try {
      regionUseCase = RegionUseCase(regionRepository);
      regionList.value = await regionUseCase.getData();
    } catch(error) {
      appLogPrint("Error $error");
    }
  }

}