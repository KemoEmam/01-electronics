import 'package:electronics_task/core/services/prefs_service.dart';
import 'package:electronics_task/core/services/service_locator.dart';
import 'package:electronics_task/electronics.dart';
import 'package:electronics_task/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await PrefsService.init();
  serviceLocator();

  runApp(const ElectronicsTask());
}
