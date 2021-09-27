import 'package:core_module/app_widget.dart';
import 'package:core_module/module.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

final runAppCore = ModularApp(
  module: CoreModule(),
  child:DevicePreview(
    enabled: !kReleaseMode,
    builder: (ctx) => const AppWidget(),
  ));