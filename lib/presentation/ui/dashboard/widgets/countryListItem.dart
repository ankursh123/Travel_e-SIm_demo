import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/config/colorPalette.dart';
import '../../../../app/config/commonTextStyle.dart';
import '../../../../app/utils/commonDimension.dart';

Widget countryListTile(String name, String img) => Card(
      margin: const EdgeInsets.only(top: CommonDimension.dp15_0),
      elevation: CommonDimension.dp5_0,
      shadowColor: ColorPalette.black,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CommonDimension.dp3_0),
        ),
        textColor: ColorPalette.white,
        leading: SizedBox(
          height: CommonDimension.dp30_0,
          width: CommonDimension.dp40_0,
          child: SvgPicture.network(
            img,
            height: CommonDimension.dp30_0,
            width: CommonDimension.dp40_0,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(name, style: CommonTextStyle.secondaryHeading.copyWith(fontSize: CommonDimension.dp14_0),
            textScaleFactor : CommonDimension.dp1_0
        ),
        trailing: const Icon(Icons.chevron_right, color: ColorPalette.white),
      ),
    );
