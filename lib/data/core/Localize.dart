import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localize {

  Localize._();

  static Localize instance = Localize._();
  late AppLocalizations key;

  void setupLocalization(BuildContext context){
    key = AppLocalizations.of(context);
  }

}