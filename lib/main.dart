import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/injection.dart';

/// Application entry point
/// Initializes dependencies before running the app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}
