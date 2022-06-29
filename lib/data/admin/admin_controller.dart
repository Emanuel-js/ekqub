import 'dart:io';

import 'package:ekub/data/admin/admin_repo.dart';
import 'package:ekub/data/user/model/user.dart';
import 'package:ekub/screens/views/admin/admin_home_screen.dart';
import 'package:ekub/utils/message_widet.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  final _isLoading = false.obs;
  final _isRegisterd = false.obs;
  final _imagFile = Rxn<File>();
  final _mainCollectorReq = Rxn<UserModel>();
  final _lat = Rxn<double>();
  final _log = Rxn<double>();

  double? get lat => _lat.value;
  set lat(val) => _lat.value = val;

  double? get log => _log.value;
  set log(val) => _log.value = val;

  bool get isLoading => _isLoading.value;

  bool get isRegisterd => _isRegisterd.value;
  set isRegisterd(val) => _isRegisterd.value = val;

  UserModel? get mainCollectorReq => _mainCollectorReq.value;
  set mainCollectorReq(val) => _mainCollectorReq.value = val;

  File? get imageFile => _imagFile.value;
  set imageFile(val) => _imagFile.value = val;

  void setLoading(bool show) {
    _isLoading.value = show;
  }

  registerMainCollector(UserModel data, File? image) async {
    setLoading(true);

    try {
      final res = await AdminRepo().registerMainCollector(data, image);
      print("======$res");
      if (res != null) {
        _isRegisterd.value = true;
        setLoading(false);
        Get.to(() => const AdminHomeScreen());
        displayMessage(title: "መልክት", msg: "በተሳካ ሁኔታ ተመዝግቧል");
      }
    } catch (e) {
      _isRegisterd.value = false;
      setLoading(false);
    }
  }
}
