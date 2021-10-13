import 'package:br_ipti_tag_app/app/features/login/presentation/bloc/login_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({Key? key, this.title = 'Login'}) : super(key: key);

  final String title;

  @override
  AuthLoginPageState createState() => AuthLoginPageState();
}

class AuthLoginPageState extends ModularState<AuthLoginPage, LoginBloc> {
  @override
  void initState() {
    controller.verifyAuthToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainLayoutAdaptativy(
        left: Container(),
        body: _Body(
          controller: controller,
        ),
        right: Container(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final LoginBloc controller;
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);
    final _formKey = GlobalKey<FormState>();

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget inputEmail(String email) => TagTextField(
          label: "Email",
          hint: "Digite seu email",
          onChanged: controller.setEmail,
          value: email,
          validator: requiredValidator,
        );
    Widget inputPassword(String password) => TagTextField(
          label: "Senha",
          hint: "Digite sua senha",
          onChanged: controller.setPassword,
          value: password,
          validator: requiredValidator,
          obscureText: true,
        );

    return Form(
      key: _formKey,
      child: Column(
        children: [
          withPadding(inputEmail("")),
          inputPassword(""),
          TagButton(
            text: "Entrar",
            onPressed: () => _submit(_formKey.currentState!),
          ),
        ],
      ),
    );
  }

  void _submit(FormState formState) {
    if (formState.validate()) {
      controller.submitLogin();
    }
  }
}
