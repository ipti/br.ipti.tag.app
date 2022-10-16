import 'package:br_ipti_tag_app/app/features/auth/presentation/bloc/login_bloc.dart';
import 'package:br_ipti_tag_app/app/shared/strings/file_paths.dart';
import 'package:br_ipti_tag_app/app/shared/validators/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/tag_ui.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({super.key, this.title = 'Login'});

  final String title;

  @override
  AuthLoginPageState createState() => AuthLoginPageState();
}

class AuthLoginPageState extends State<AuthLoginPage> {
  final controller = Modular.get<LoginBloc>();

  @override
  void initState() {
    controller.verifyAuthToken();
    controller.fetchVersion();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
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
            const _Logo(),
            const TagRainbowBar(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: Column(
                    children: [
                      const Spacer(),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: TagColors.colorRedDark,
                                content: Text(state.message),
                              ),
                            );
                          }
                        },
                        bloc: controller,
                        builder: (context, state) {
                          if (state is LoginLoadedState) {
                            return _Footer(
                              version: state.appVersion,
                              year: state.year,
                            );
                          }

                          return _Footer(
                            version: "0.0.0",
                            year: controller.yearSequence.first.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Body(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

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

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.controller,
  });
  final LoginBloc controller;

  static final _formKey = GlobalKey<FormState>();

  Widget withPadding(Widget widget) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget,
      );

  Widget inputUsername(String? username) => TagTextField(
        label: "Usuário",
        hint: "Digite seu usuário",
        onChanged: (username) => controller.username = username,
        value: username,
        validator: requiredValidator,
      );
  Widget inputPassword(String? password) => TagTextField(
        label: "Senha",
        hint: "Digite sua senha",
        onChanged: (password) => controller.password = password,
        value: password,
        validator: requiredValidator,
        obscureText: true,
      );

  Widget dropdownYear(String? year) => TagDropdownField<String>(
        label: "Ano letivo",
        items: Map.fromEntries(controller.yearSequence),
        onChanged: (value) => controller.schoolYear = value,
        value: year,
        validator: requiredDropdownValidator<String?>(),
      );

  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();

    return RawKeyboardListener(
      autofocus: true,
      focusNode: focus,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          _submit(_formKey.currentState!);
        }
      },
      child: Form(
        key: _formKey,
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: controller,
          builder: (context, state) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 332),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Entre com as suas credenciais",
                      style: TextStyle(
                        color: TagColors.colorBaseInkLight,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.75,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  withPadding(
                    inputUsername(controller.username),
                  ),
                  withPadding(
                    inputPassword(controller.password),
                  ),
                  withPadding(
                    dropdownYear(controller.schoolYear),
                  ),
                  Flexible(
                    child: withPadding(
                      TagButton(
                        text: "Entrar",
                        onPressed: () => _submit(_formKey.currentState!),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
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
    required this.version,
    required this.year,
  });

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
                    ..onTap = () => launchUrlString("https://www.ipti.org.br/"),
                ),
                const TextSpan(text: " ®"),
                TextSpan(text: year),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
