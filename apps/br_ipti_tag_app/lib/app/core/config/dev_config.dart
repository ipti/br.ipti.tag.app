import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "https://tag-dev-v3.fly.dev";

  @override
  bool get reportErrors => false;

  @override
  bool get debugRequests => true;

  @override
  bool get reportPerformance => false;

  @override
  bool get runFirebase => false;
}
