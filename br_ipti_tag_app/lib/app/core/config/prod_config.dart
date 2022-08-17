import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "http://ec2-3-230-55-29.compute-1.amazonaws.com:3000";

  @override
  bool get reportErrors => true;

  @override
  bool get debugRequests => false;

  @override
  bool get reportPerformance => true;

  @override
  bool get runFirebase => true;
}
