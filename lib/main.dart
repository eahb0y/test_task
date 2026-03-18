import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/dependency_injection.dart';

import 'app.dart';
import 'core/storage/app_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  await setupServiceLocator(preferences: AppPreferences(preferences));
  runApp(const App());
}
