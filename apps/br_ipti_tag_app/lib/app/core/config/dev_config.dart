import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost =>
      "http://tag-api-loadbalance-772604107.us-east-1.elb.amazonaws.com:3000";

  @override
  bool get reportErrors => false;

  @override
  bool get debugRequests => false;

  @override
  bool get reportPerformance => false;

  @override
  bool get runFirebase => false;
}
