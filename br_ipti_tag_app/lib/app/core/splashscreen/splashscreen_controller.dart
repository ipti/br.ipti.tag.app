import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/auth/domain/usecases/verify_auth_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenController {
  final VerifyAuthUsecase _verifyAuthUsecase;

  SplashScreenController(this._verifyAuthUsecase);

  Future<void> verifyAuthToken() async {
    final result = await _verifyAuthUsecase(
      NoParams(),
    );
    result.fold(
      (error) => Modular.to.pushReplacementNamed("/auth/"),
      (token) => Modular.to.pushReplacementNamed("/turmas/"),
    );
  }
}
