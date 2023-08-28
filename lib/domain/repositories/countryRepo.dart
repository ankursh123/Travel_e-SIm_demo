import '../../data/models/countryModel.dart';

abstract class Country {

  ///Must Override this function to get Country Data.
  Future<List<CountryModel>> getCountryData();

}