import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:training_task1/features/home/screens/home_screen.dart';

class LoginController extends GetxController {
  static final LocalAuthentication _auth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;
  var isUserAuthenticated = false.obs;

  @override
  void onInit() {
    _getAvailabeBiometrics();
    super.onInit();
  }

//to return a true result open the emulator go to settings -> imprint&password -> three dots ->fingerprint ->tap on any fingerprint
  Future<bool> canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  void _getAvailabeBiometrics() async {
    bool hasLocalAuth = await canAuthenticate();
    print(hasLocalAuth);
    if (hasLocalAuth) {
      List<BiometricType> availableBiometrics =
          await _auth.getAvailableBiometrics();
      print("list AvailableBiometrics: $availableBiometrics");
      hasFingerPrintLock.value =
          availableBiometrics.contains(BiometricType.strong);
    } else {
      showSnackBar('Error', 'Local Authentication not available', Colors.red);
    }
  }

  void showSnackBar(String title, String message, Color color) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    ));
  }

  void authenticateUser() async {
    try {
      if (!await canAuthenticate()) return;

      isUserAuthenticated.value = await _auth.authenticate(
          localizedReason: 'Authenticate with fingerprint',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
            useErrorDialogs: true,
          ));
      if (isUserAuthenticated.value) {
        Get.off(MyHomePage());
      }
    } catch (e) {
      debugPrint('error $e');
      showSnackBar('error', e.toString(), Colors.red);
    }
  }

//if State object is disposed return
}
