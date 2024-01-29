import 'package:get/get.dart';
import 'package:national_bonds_app/DioApiHandler/ApiServices.dart';
import 'package:national_bonds_app/UI/Authentication/Login/LoginController.dart';
import 'package:national_bonds_app/UI/HomeScreen/HomeController.dart';

class CommonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiServices());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
  }
}
