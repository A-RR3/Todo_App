import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/features/categories/widgets/material_botton.dart';
import 'package:training_task1/features/login/login_controller.dart';
import 'package:training_task1/core/widgets/icon_widget.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  @override
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            IconWidget(path: 'assets/icons/Vector.svg'),
            Obx(
              () => controller.hasFingerPrintLock.value
                  ? const Text('support fingerprint auth')
                  : const Text('not supported'),
            ),
            const Spacer(
              flex: 1,
            ),
            Align(
                heightFactor: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: MyMaterialBotton(
                        onPress: () => controller.authenticateUser(),
                        text: 'Unlock App',
                        textColor: Colors.white,
                        bottonColor: primaryColor,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
