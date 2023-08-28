import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_demo_persatation_1/data/core/Localize.dart';
import 'package:mvvm_demo_persatation_1/presentation/ui/dashboard/widgets/bottomNavBar.dart';
import '../../../app/config/colorPalette.dart';
import '../../../app/config/extensions.dart';
import '../../../app/utils/commonDimension.dart';
import '../account/account.dart';
import '../home/home.dart';
import '../mySims/mySims.dart';

/// Created by Appinventiv  on [17-Aug-2023].
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  List<Widget> widgetList = [Home(), MySims(), MyAccount()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.colorGrey900,
        body: widgetList[index],
        bottomNavigationBar: BottomNavigationBar(
          elevation: CommonDimension.dp10_0,
          unselectedFontSize: CommonDimension.dp12_0,
          selectedFontSize: CommonDimension.dp12_0,
          selectedItemColor: ColorPalette.white,
          currentIndex: index,
          onTap: (int index) {
            if (index != 0){
              showSnackBar(context, Localize.instance.key.notAvailable);
            }
          },
          type: BottomNavigationBarType.fixed,
          items: [
            CustomBottomNavBar().bottomNavItem(Localize.instance.key.store),
            CustomBottomNavBar().bottomNavItem(Localize.instance.key.myESim),
            CustomBottomNavBar().bottomNavItem(Localize.instance.key.profile)
          ],
        ),
      ),
    );
  }



}
