import 'package:get/get.dart';
import 'package:national_bonds_app/GeneralBinding/CommonBinding.dart';
import 'package:national_bonds_app/UI/Authentication/Login/LoginScreen.dart';
import 'package:national_bonds_app/UI/HomeScreen/HomeScreen.dart';
import 'package:national_bonds_app/UI/SplashScreen/SplashScreen.dart';

class AppRoutes {
  static const String initialRoutes = "/";
  static const String login = "/login";
  static const String splash = "/splash";
  static const String home = "/home";

  static List<GetPage<dynamic>> get generateRoutes => [
        GetPage(name: login, page: () => LoginScreen(), binding: CommonBinding()),
        GetPage(name: splash, page: () => SplashScreen(), binding: CommonBinding()),
        GetPage(name: home, page: () => HomeScreen(), binding: CommonBinding()),
      ];
}
