import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/core/config/enviroment.dart';
import 'firebase_options.dart';

void main() {
  // Initialize Environment
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.DEV,
  );

  Environment().initConfig(environment);

  if (Environment().config.runFirebase) {
    _runAppWithFirebase();
  } else {
    _runWithoutFirebase();
  }
}

void _runAppWithFirebase() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
      Environment().config.reportErrors && !kDebugMode,
    );

    if (Environment().config.reportErrors) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }

    await FirebasePerformance.instance.setPerformanceCollectionEnabled(
      Environment().config.reportPerformance && !kDebugMode,
    );

    runApp(ModularApp(module: AppModule(), child: AppWidget()));
  }, (error, stack) {
    if (Environment().config.reportErrors) {
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
  });
}

void _runWithoutFirebase() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
