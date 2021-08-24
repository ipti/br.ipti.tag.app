import 'package:flutter/material.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayoutAdaptativy(
      body: Center(
        child: Text("Realizar login"),
      ),
    );
  }
}
