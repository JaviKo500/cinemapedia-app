

import 'package:flutter/material.dart';

class AppTheme {
  
  ThemeData getTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xff2862F5),
  );
}