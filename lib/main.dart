import 'package:ekub/appInit.dart';
import 'package:ekub/data/admin/admin_controller.dart';
import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/maincollector/main_collector_controller.dart';
import 'package:ekub/screens/views/commenview/onbording_screen.dart';
import 'package:ekub/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await initApp();
  runApp(const MyApp());

  Get.put(AuthController());
  Get.put(AdminController());
  Get.put(MainCollectorController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'እኩብ',
      theme: AppTheme.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnboardingScreen(),
      ),
    );
  }

  // Widget getPage() {
  //   if (LocalStorageService.instance.get("accessToken") != null) {
  //     return const MyHomePage();
  //   }
  //   return const OnboardingScreen();
  // }
}
