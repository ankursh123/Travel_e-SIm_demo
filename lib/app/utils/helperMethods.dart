
/// Created by Appinventiv  on [18-Aug-2023].
class HelperMethods {
  static bool isNotNullNorEmpty(var value){
    if(value != null && value.isNotEmpty){
      return true;
    }
    return false;
  }

}