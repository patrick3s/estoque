import 'package:core_module/core_module.dart';
import 'package:core_module/run_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(runAppCore);
}
