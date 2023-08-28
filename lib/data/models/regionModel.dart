/// Created by Appinventiv  on [17-Aug-2023].
class RegionModel {

  int? id;
  String? regionImage;
  String? regionName;

  RegionModel({this.id, this.regionImage,this.regionName});

  fromJson(List json) {
    List<RegionModel> regionModel = [];
    regionModel.addAll(json.map((element) {
      return RegionModel(
          id: element["id"],
          regionName: element["regionName"],
          regionImage: element["regionImage"]
        );
      }
    ));
    return regionModel;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map["id"] = id;
    map["regionName"] = regionName;
    map["regionImage"] = regionImage;
    return map;
  }
}
