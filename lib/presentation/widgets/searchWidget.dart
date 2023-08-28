import 'package:flutter/material.dart';
import '../../app/config/colorPalette.dart';
import '../../app/config/commonTextStyle.dart';
import '../../app/utils/commonDimension.dart';
import '../../data/core/Localize.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: CommonDimension.dpZero,
          toolbarHeight: CommonDimension.dp60_0,
          titleSpacing: CommonDimension.dpZero,
          backgroundColor: ColorPalette.colorGrey900,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: CommonDimension.dp16_0),
              child: Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(Localize.instance.key.cancel,
                          style: CommonTextStyle.secondaryHeading
                              .copyWith(fontSize: CommonDimension.dp12_0)))),
            )
          ],
          automaticallyImplyLeading: false,
          title: Container(
            margin: const EdgeInsets.all(CommonDimension.dp16_0),
            padding:
                const EdgeInsets.symmetric(vertical: CommonDimension.dp4_0),
            height: CommonDimension.dp35_0,
            decoration: BoxDecoration(
                color: ColorPalette.colorDarkGrey,
                borderRadius: BorderRadius.circular(CommonDimension.dp3_0)),
            child: InkWell(
              onTap: () {},
              child: TextField(
                  focusNode: focusNode,
                  maxLines: CommonDimension.dp1,
                  style: CommonTextStyle.secondaryHeading, //
                  cursorColor: ColorPalette.white,
                  decoration: InputDecoration(
                      constraints: const BoxConstraints(
                          maxHeight: CommonDimension.dpZero),
                      hintText: Localize.instance.key.search,
                      hintStyle: CommonTextStyle.secondaryHeading.copyWith(
                          fontSize: CommonDimension.dp14_0,
                          color: ColorPalette.colorGrey),
                      border: InputBorder.none,
                      prefixIconConstraints: const BoxConstraints(
                          minWidth: CommonDimension.dp35_0),
                      prefixIcon: const Icon(Icons.search,
                          size: CommonDimension.dp20_0,
                          color: ColorPalette.colorGrey))),
            ),
          ),
        ),
        body: const SizedBox());
  }
}
