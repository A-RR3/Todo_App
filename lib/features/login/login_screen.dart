import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/features/categories/widgets/material_botton.dart';
import 'package:training_task1/widgets/icon_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
    super.initState();
  }

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
            if (_supportState)
              const Text('supported device')
            else
              const Text('not supported'),
            const Spacer(
              flex: 1,
            ),
            Align(
                heightFactor: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: MyMaterialBotton(
                        onPress: () {
                          _getAvailabeBiometrics;
                        },
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

  Future<void> _getAvailabeBiometrics() async {
    print('here');
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print("list AvailableBiometrics: $availableBiometrics");

//if State object is disposed return
    if (!mounted) {
      return;
    }
  }
}
