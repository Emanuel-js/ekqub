import 'dart:developer';

import 'package:ekub/constants/role.dart';
import 'package:ekub/data/auth/auth_repo.dart';
import 'package:ekub/data/auth/model/auth_model.dart';
import 'package:ekub/data/helpers/local_storage_provider.dart';
import 'package:ekub/data/user/model/user_account_model.dart';
import 'package:ekub/data/user/model/user_detail_model.dart';
import 'package:ekub/screens/views/admin/admin_home_screen.dart';
import 'package:ekub/screens/views/collectors/main_collector_home_screen.dart';
import 'package:ekub/screens/views/commenview/WelcomeScreen.dart';
import 'package:ekub/screens/views/subcollectors/subcollector_home_screen.dart';
import 'package:ekub/screens/views/users/user_main_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late String _signedInUser;
  final _userInfo = UserAccountModel().obs;
  final _userDetail = <UserDetailModel>[].obs;

  late String _signRole;
  final _isLogged = false.obs;
  final _isLoading = false.obs;

  String get signedInUser => _signedInUser;
  String get signdRole => _signRole;

  UserAccountModel? get userInfo => _userInfo.value;

  List<UserDetailModel>? get userDetail => _userDetail.value;
  set userDetail(val) => _userDetail.value = val;

  bool get isLoading => _isLoading.value;
  bool get isLogged => _isLogged.value;

  void setLoading(bool show) {
    _isLoading.value = show;
    // _isLoading(true);
  }

  void handleRole(String role) {
    if (role == Role.ROlE_ADMIN) {
      Get.off(() => const AdminHomeScreen());
    } else if (role == Role.ROLE_MAIN_COLLECTOR) {
      Get.off(() => const MainCollectorHomeScreen());
    } else if (role == Role.ROLE_SUB_COLLECTOR) {
      Get.off(() => const SubCollectorHomeScreen());
    } else if (role == Role.ROlE_USER) {
      Get.off(() => const UserMainScreen());
    }
  }

  void login(AuthModel data) async {
    setLoading(true);
    try {
      final result = await AuthRepo().login(data);

      await LocalStorageService.instance
          .addNew("accessToken", result["accessToken"]);
      await LocalStorageService.instance
          .addNew("role", result["roles"][0]["name"]);

      if (result != null) {
        setLoading(false);

        if (result["accessToken"] != null) {
          _signedInUser = result["accessToken"];
          _signRole = result["roles"][0]["name"];

          _userInfo.value = UserAccountModel(
              username: result["loggedInUserProfileData"]["username"],
              email: result["loggedInUserProfileData"]["email"],
              id: result["loggedInUserProfileData"]["id"].toString());

          handleRole(signdRole);
        } else {
          Get.snackbar("error", "error");
        }
      }
    } catch (e) {
      setLoading(false);
    }
  }

  void getUserMyUsers() async {
    try {
      final result = await AuthRepo().getMyUsers();
      log(result.toString());
      _userDetail.value = result;
    } catch (e) {
      setLoading(false);
    }
  }

  void logOut() {
    _isLogged.value = false;
    LocalStorageService.instance.remove("roles");
    LocalStorageService.instance.remove("accessToken");
    Get.offAll(() => const WelcomeScreen());
  }
}
