import 'package:ekub/appInit.dart';
import 'package:ekub/constants/messages.dart';
import 'package:ekub/data/admin/admin_controller.dart';
import 'package:ekub/data/auth/auth_controller.dart';
import 'package:ekub/data/helpers/local_storage_provider.dart';
import 'package:ekub/data/maincollector/main_collector_controller.dart';
import 'package:ekub/data/subcollector/sub_collector_controller.dart';
import 'package:ekub/data/ticket/ticket_controller.dart';
import 'package:ekub/data/wallet/wallet_controller.dart';
import 'package:ekub/screens/views/commenview/WelcomeScreen.dart';
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
  Get.put(SubCollectorController());
  Get.put(WalletController());
  Get.put(TicketController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<AuthController>();
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'እቁብ',
        theme:
            _controller.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
        themeMode: ThemeMode.system,
        home: const MyHomePage(),
      ),
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
    return SafeArea(
      child: Scaffold(
        body: getPage(),
      ),
    );
  }

  Widget getPage() {
    if (LocalStorageService.instance.get(AppConst.APP_ACCESS_TOKEN) != null) {
      return const WelcomeScreen();
    }
    return const OnboardingScreen();
  }
}
