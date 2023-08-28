import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/config/colorPalette.dart';
import '../../../../app/config/commonTextStyle.dart';
import '../../../../app/utils/commonImages.dart';
import '../../../../app/utils/commonDimension.dart';
import '../../../../data/core/Localize.dart';
import '../../../../data/models/eSimModel.dart';
import '../../../viewModels/home/homeViewModel.dart';
import '../../../widgets/commonWidgets.dart';
import '../../home/widgets/GlobalESimWidgets.dart';

class GlobalESimCard extends StatefulWidget {

  ESimModel simData;
  GlobalESimCard({super.key, required this.simData});

  @override
  State<GlobalESimCard> createState() => _GlobalESimCardState(simData: simData);
}

class _GlobalESimCardState extends State<GlobalESimCard> {

  ESimModel simData;
  _GlobalESimCardState({required this.simData});
  HomeViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
        return Container(
          height: viewModel.showCallsAndText.value ? size.height * CommonDimension.dp0_62 : size.height * CommonDimension.dp0_49,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: CommonDimension.dp12_0),
          child: Stack(
            children: [
              Positioned(
                bottom: CommonDimension.dpZero,
                left: CommonDimension.dpZero,
                right: CommonDimension.dpZero,
                child: Container(
                  height: viewModel.showCallsAndText.value ? size.height * CommonDimension.dp0_58 : size.height * CommonDimension.dp0_45,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        ColorPalette.blue,
                        ColorPalette.lightBlue
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    ),
                    borderRadius: BorderRadius.circular(CommonDimension.dp12_0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: CommonDimension.dp32_0,
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: CommonDimension.dp32_0),
                        child: Text(Localize.instance.key.discovery,
                          textAlign: TextAlign.left,
                        style: CommonTextStyle.heading.copyWith(color: ColorPalette.white),
                        ),
                      ),
                      CommonWidgets.commonSizedBoxHeight32(),
                      GlobalESimWidgets.commonDivider(),
                      GlobalESimWidgets.eSIMCoverageRow(const Icon(Icons.access_time_filled), Localize.instance.key.coverage, simData.coverage ?? ""),
                      GlobalESimWidgets.eSIMRow(const Icon(Icons.upload_rounded), Localize.instance.key.data.toUpperCase(), simData.data ?? ""),
                      if(viewModel.showCallsAndText.value) ...[
                        GlobalESimWidgets.eSIMRow(const Icon(Icons.call), Localize.instance.key.calls.toUpperCase(), simData.call ?? ""),
                        GlobalESimWidgets.eSIMRow(const Icon(Icons.sms), Localize.instance.key.texts, simData.text ?? ""),
                      ],
                      GlobalESimWidgets.eSIMRow(const Icon(Icons.calendar_month), Localize.instance.key.validity, simData.validity ?? ""),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: CommonDimension.dp24_0,
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: CommonDimension.dp50_0,
                          onPressed: (){},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(CommonDimension.dp8_0),
                            side: const BorderSide(
                              color: ColorPalette.white
                            ),
                          ),
                          child: Text(Localize.instance.key.buyNow, style: CommonTextStyle.cardTitle, ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: CommonDimension.dp10_0,
                top: CommonDimension.dp10_0,
                child: Image.asset(AppImages.discover,
                  height: CommonDimension.dp100_0,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}