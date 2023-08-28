import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Created by Appinventiv  on [18-Aug-2023].
showSnackBar(BuildContext context,String msg) {
  ScaffoldMessenger.of(context).clearSnackBars();
  final snackBar = SnackBar(
    content:  Text(msg),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

appDebugPrint(dynamic message)
{
  if (kDebugMode) {
    print(message);
  }
}

appLogPrint(String message)
{
  if (kDebugMode) {
    log(message);
  }

}
