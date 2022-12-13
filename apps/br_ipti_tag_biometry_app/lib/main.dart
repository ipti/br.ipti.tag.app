import 'package:br_ipti_tag_biometry_app/app_module.dart';
import 'package:br_ipti_tag_biometry_app/app_widget.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/sign/biometrics_sign.dart';
import 'package:br_ipti_tag_biometry_app/screens/biometrics/presentation/identification/school_entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
