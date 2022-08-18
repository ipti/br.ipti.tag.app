import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "http://ec2-3-230-55-29.compute-1.amazonaws.com:3000";

  @override
  bool get reportErrors => false;

  @override
  bool get debugRequests => false;

  @override
  bool get reportPerformance => false;

  @override
  bool get runFirebase => false;
}
