import 'package:br_ipti_tag_biometry_app/screens/biometrics_sign.dart';
import 'package:br_ipti_tag_biometry_app/screens/school_entrance.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Biometria',
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => const SchoolEntrance(),
          '/Sign': (context) => const BiometricsSign()
        });
  }
}
