import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mvvm_demo_persatation_1/app/utils/commonDimension.dart';
import 'package:mvvm_demo_persatation_1/presentation/ui/splash/splash.dart';
import 'app/utils/app_routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [Locale("en")],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        final scale = data.textScaleFactor.clamp(CommonDimension.dp0_8, CommonDimension.dp0_9);
        return MediaQuery(
          data: data.copyWith(
          textScaleFactor: CommonDimension.dp1_0
        ),
        child: child!,
        );
      },
      // theme: Themes.light,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      onGenerateRoute: AppRouteSetting().onGenerateRoute(),
      home: const Splash(),
    );
  }

}

