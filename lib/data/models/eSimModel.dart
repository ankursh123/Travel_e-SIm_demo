/// Created by Appinventiv  on [18-Aug-2023].

class ESimModel {

  String? coverage;
  String? data;
  String? call;
  String? text;
  String? validity;

  ESimModel({this.coverage, this.data, this.call, this.text, this.validity});

  fromJSON(List json) {
    List<ESimModel> simDATA = [];
    simDATA.addAll(json.map((element) {
      return ESimModel(
        coverage: element["coverage"] ?? "",
        data: element["data"] ?? "",
        call: element["call"] ?? "",
        text: element["text"] ?? "",
        validity: element["validity"] ?? "",
      );
    }));
    return simDATA;

  }

}