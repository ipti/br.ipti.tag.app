import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost =>
      "https://apitag.azurewebsites.net/";

  @override
  bool get reportErrors => false;

  @override
  bool get debugRequests => false;

  @override
  bool get reportPerformance => false;

  @override
  bool get runFirebase => false;
}
