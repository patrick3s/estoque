import 'package:design_system_surprise_box/theme/default_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final BuildContext context;

  AppTheme(this.context);

  ThemeData get defaultTheme => ThemeDefault.getTheme(context);
}