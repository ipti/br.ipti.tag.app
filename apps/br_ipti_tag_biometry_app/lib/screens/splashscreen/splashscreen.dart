import 'package:br_ipti_tag_biometry_app/screens/splashscreen/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Modular.get<SplashScreenController>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    controller.verifyAuthToken();
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: TagColors.colorBaseWhiteNormal,
      child: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: TagLogo(),
        ),
      ),
    );
  }
}
