import 'package:package_info_plus/package_info_plus.dart';

abstract class PackageInfoService {
  Future<String> getAppName();
  Future<String> getPackageName();
  Future<String> getVersion();
  Future<String> getBuildNumber();
}

class PackageInfoServiceImpl implements PackageInfoService {
  @override
  Future<String> getAppName() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.appName;
  }

  @override
  Future<String> getBuildNumber() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.buildNumber;
  }

  @override
  Future<String> getPackageName() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.packageName;
  }

  @override
  Future<String> getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }
}
