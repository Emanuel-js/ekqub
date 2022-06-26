import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> initApp() async {
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    binding.renderView.automaticSystemUiAdjustment = false;
  }

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
