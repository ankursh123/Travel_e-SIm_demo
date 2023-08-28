import 'package:flutter/material.dart';
import '../../../app/utils/commonImages.dart';
import '../../../app/utils/app_routes.dart';
import '../../../data/core/Localize.dart';
import '../../../main.dart';
import '../../../app/utils/commonDimension.dart';
/// Created by Appinventiv  on [16-Aug-2023].
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: CommonDimension.dp2), () {
      navigatorKey?.currentState?.pushReplacementNamed(Routes.dashboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    Localize.instance.setupLocalization(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image(
        fit: BoxFit.cover,
        height: CommonDimension.dp250,
          width: CommonDimension.dp250,
          image: AssetImage(AppImages.splashLogo))),
    );
  }
}
