import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "https://tag-dev-v3.fly.dev";

  @override
  bool get reportErrors => true;

  @override
  bool get debugRequests => false;

  @override
  bool get reportPerformance => true;

  @override
  bool get runFirebase => true;
}
