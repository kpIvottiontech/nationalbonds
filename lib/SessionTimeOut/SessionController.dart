import 'dart:async';
import 'package:get/get.dart';
import 'package:national_bonds_app/Routes/Routes.dart';

class SessionController extends GetxController {
  Timer? _timer;

  void handleUserInteraction([_]) {
    if (_timer != null && !_timer!.isActive) {
      // This means the user has been logged out
      return;
    }
    _timer?.cancel();

    startSessionTimer();
  }

  void startSessionTimer() {
    if (_timer != null) _timer!.cancel();
    const time = Duration(seconds: 10 );
    _timer = Timer(time, () {
      print('hello testing timer $time');
      Get.offAllNamed(AppRoutes.login);
    });
  }

  void resetSessionTimer() {
    // Reset the timer when there's user activity
    _timer?.cancel();
    startSessionTimer();
  }

  @override
  void onInit() {
    super.onInit();
    // Start the session timer when the controller is initialized
    startSessionTimer();
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is closed
    _timer?.cancel();
    super.onClose();
  }
}