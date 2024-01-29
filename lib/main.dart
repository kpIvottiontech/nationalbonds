import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:national_bonds_app/Components/CommonSize/CommonHeightWidth.dart';
import 'package:national_bonds_app/GeneralBinding/CommonBinding.dart';
import 'package:national_bonds_app/Localization/AppLocalization.dart';
import 'package:national_bonds_app/Localization/LanguageConstants.dart';
import 'package:national_bonds_app/Routes/Routes.dart';
import 'package:national_bonds_app/SessionTimeOut/SessionController.dart';
import 'package:national_bonds_app/Theme/CustomTheme.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  SessionController sessionController =Get.put(SessionController());
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('hello testing... session state');
    return _locale == null
        ? Container()
        : Sizer(
            builder: (context, orientation, deviceType) {
              AppDimensions.createInstance(context, SizerUtil.boxConstraints);
              AppDimensions.instance!.orientation =
                  AppDimensions.update(context, SizerUtil.boxConstraints)
                      .orientation;
              AppDimensions.instance!.height =
                  AppDimensions.update(context, SizerUtil.boxConstraints)
                      .height;
              AppDimensions.instance!.width =
                  AppDimensions.update(context, SizerUtil.boxConstraints).width;
              return Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: sessionController.handleUserInteraction,
                onPointerMove: sessionController.handleUserInteraction,
                onPointerUp: sessionController.handleUserInteraction,
                child: GetMaterialApp(
                  locale: _locale,
                  supportedLocales: const [
                    Locale("en", "US"),
                    Locale("ar", "SA"),
                  ],
                  localizationsDelegates: const [
                    AppLocalization.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  localeResolutionCallback: (locale, supportedLocales) {
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode ==
                              locale!.languageCode &&
                          supportedLocale.countryCode == locale.countryCode) {
                        return supportedLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  theme: CustomTheme.lightTheme,
                  darkTheme: CustomTheme.lightTheme,
                  getPages: AppRoutes.generateRoutes,
                  initialRoute: AppRoutes.splash,
                  themeMode: ThemeMode.system,
                  initialBinding: CommonBinding(),
                  debugShowCheckedModeBanner: false,
                ),
              );
            },
          );
  }

}
