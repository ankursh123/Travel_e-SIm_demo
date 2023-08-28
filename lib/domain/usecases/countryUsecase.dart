import 'package:mvvm_demo_persatation_1/domain/repositories/countryRepo.dart';
import '../../data/models/countryModel.dart';

class CountryUseCase {

  final Country country;
  CountryUseCase(this.country);

  Future<List<CountryModel>> getData() async{
    return country.getCountryData();
  }

}