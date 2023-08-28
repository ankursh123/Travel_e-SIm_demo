import '../../app/config/Constants.dart';

/// Created by Appinventiv  on [17-Aug-2023].
class CountryModel {
  int? id;
  String? name;
  String? code;
  String? imageUrl;

  CountryModel({this.id, this.name,this.imageUrl,this.code});

  fromJson(List json) {
    List<CountryModel> countryList = [];
    countryList.addAll(
        json.map<CountryModel>((element) {
          return CountryModel(
              id: element["id"],
              name: element["country"],
              imageUrl: element["flag"],
              code: element["code"]
          );
        })
    );
    return countryList;
  }

  JSON toJson() {
    JSON map = {};
    map["id"] = id;
    map["name"] = name;
    map["imageUrl"] = imageUrl;
    map["code"] = code;
    return map;
  }
}
