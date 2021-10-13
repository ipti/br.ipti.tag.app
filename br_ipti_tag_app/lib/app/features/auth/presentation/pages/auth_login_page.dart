import 'package:br_ipti_tag_app/app/features/auth/presentation/bloc/login_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:url_launcher/url_launcher.dart';

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
    controller.fetchVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                FilePaths.TAG_LOGO_FOR_BACKGROUND,
                semanticsLabel: 'TAG Logo',
                alignment: Alignment.topRight,
              ),
            ),
            Center(
              child: _Body(
                controller: controller,
              ),
            ),
            const _Logo(),
            const TagRainbowBar(),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<LoginBloc, LoginState>(
                bloc: controller,
                builder: (context, state) {
                  return _Footer(version: state.appVersion, year: state.year);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 42),
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 64),
        child: const TagLogo(
          alignment: Alignment.topLeft,
        ),
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

    const helpTextStyle = TextStyle(
      color: TagColors.colorBaseInkLight,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.75,
    );

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    Widget inputEmail(String email) => TagTextField(
          label: "Usuário",
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
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: controller,
        builder: (context, state) {
          if (state is LoginState) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 332),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Entre com as suas credenciais",
                      style: helpTextStyle,
                    ),
                  ),
                  withPadding(inputEmail(state.email)),
                  withPadding(inputPassword(state.password)),
                  withPadding(
                    TagButton(
                      text: "Entrar",
                      onPressed: () => _submit(_formKey.currentState!),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _submit(FormState formState) {
    if (formState.validate()) {
      controller.submitLogin();
    }
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
    required this.version,
    required this.year,
  }) : super(key: key);

  final String version;
  final String year;

  @override
  Widget build(BuildContext context) {
    const footerStyle = TextStyle(
      color: TagColors.colorBaseInkNormal,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.75,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Versão $version",
            style: footerStyle,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: footerStyle,
              text: 'Tecnologia desenvolvida pelo ',
              children: [
                TextSpan(
                  text: "Instituto de Pesquisas em Tecnologia e Inovação",
                  style: footerStyle.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launch("https://www.ipti.org.br/"),
                ),
                const TextSpan(text: " ®"),
                TextSpan(text: year),
              ],
            ),
          )
        ],
      ),
    );
  }
}
