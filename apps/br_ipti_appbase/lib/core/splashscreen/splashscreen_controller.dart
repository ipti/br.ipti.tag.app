import 'package:br_ipti_appbase/domain/auth/usecases/verify_auth_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

class SplashScreenController {
  final VerifyAuthUsecase _verifyAuthUsecase;

  SplashScreenController(this._verifyAuthUsecase);

  Future<void> verifyAuthToken() async {
    final result = await _verifyAuthUsecase(
      EmptyParams(),
    );
    result.fold(
      (error) => Modular.to.pushReplacementNamed("/auth/"),
      (token) => Modular.to.pushReplacementNamed("/home/"),
    );
  }
}
