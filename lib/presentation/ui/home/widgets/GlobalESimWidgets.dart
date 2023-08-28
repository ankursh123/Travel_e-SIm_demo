import 'package:flutter/material.dart';

import '../../../../app/config/colorPalette.dart';
import '../../../../app/config/commonTextStyle.dart';
import '../../../widgets/commonWidgets.dart';

/// Created by Appinventiv  on [16-Aug-2023].
class GlobalESimWidgets {

  static Divider commonDivider(){
    return const Divider(
      color: ColorPalette.lightBlueAccent,
    );
  }

  static Widget eSIMRow(Icon leadingIcon, String title, String description){
    return Column(
      children: [
        Row(
          children: [
            CommonWidgets.commonSizedBoxWidth24(),
            leadingIcon,
            CommonWidgets.commonSizedBoxWidth16(),
            Text(title, style: CommonTextStyle.cardTitle, textScaleFactor: 1.0,),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description, style: CommonTextStyle.cardDescription, textScaleFactor: 1.0,),
            ),
            CommonWidgets.commonSizedBoxWidth24(),
          ],
        ),
        commonDivider(),
      ],
    );
  }

  static Widget eSIMCoverageRow(Icon leadingIcon, String title, String description){
    return Column(
      children: [
        Row(
          children: [
            CommonWidgets.commonSizedBoxWidth24(),
            leadingIcon,
            CommonWidgets.commonSizedBoxWidth16(),
            Text(title, style: CommonTextStyle.cardTitle, textScaleFactor: 1.0,),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: ColorPalette.white),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description, style: CommonTextStyle.cardDescription, textScaleFactor: 1.0,),
              ),
            ),
            CommonWidgets.commonSizedBoxWidth24(),
          ],
        ),
        commonDivider(),
      ],
    );
  }

}
