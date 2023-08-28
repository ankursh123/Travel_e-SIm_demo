import 'package:flutter/material.dart';
import 'colorPalette.dart';

/// Created by Appinventiv  on [17-Aug-2023].
class CommonTextStyle {
  static TextStyle heading = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  static TextStyle secondaryHeading = const TextStyle(color: ColorPalette.white , fontWeight: FontWeight.w600, fontSize: 16.0,);
  static TextStyle cardTitle = const TextStyle(color: ColorPalette.white , fontWeight: FontWeight.w400, fontSize: 14.0,);
  static TextStyle cardDescription = const TextStyle(color: ColorPalette.white , fontWeight: FontWeight.w600, fontSize: 16.0,);
  static TextStyle appBarHeading = const TextStyle(color: ColorPalette.white, fontWeight: FontWeight.w500, fontSize: 24.0);
}