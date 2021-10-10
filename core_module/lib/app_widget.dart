import 'package:commons/util/env.dart';
import 'package:design_system_surprise_box/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: EnvApp.appName,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme(context).defaultTheme,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}