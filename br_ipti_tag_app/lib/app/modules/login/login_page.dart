import 'package:br_ipti_tag_app/app/shared/widgets/templates/main_layout_adaptativy.dart';
import 'package:flutter/material.dart';

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
