import 'package:ekub/constants/role.dart';
import 'package:ekub/data/auth/auth_repo.dart';
import 'package:ekub/data/auth/model/auth_model.dart';
import 'package:ekub/data/helpers/local_storage_provider.dart';
import 'package:ekub/data/user/model/user.dart';
import 'package:ekub/screens/views/admin/admin_home_screen.dart';
import 'package:ekub/screens/views/collectors/main_collector_home_screen.dart';
import 'package:ekub/screens/views/commenview/WelcomeScreen.dart';
import 'package:ekub/screens/views/subcollectors/subcollector_home_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late String _signedInUser;
  final _userInfo = <UserModel>[].obs;
  late String _signRole;
  final _isLogged = false.obs;
  final _isLoading = false.obs;

  String get signedInUser => _signedInUser;
  String get signdRole => _signRole;
  List<UserModel> get userInfo => _userInfo.value;

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
          handleRole(signdRole);
        } else {
          Get.snackbar("error", "error");
        }
      }
    } catch (e) {
      setLoading(false);
    }
  }

  void getUser() async {
    try {
      final result = await AuthRepo().getUser();
      // log("message$result");
      _userInfo.value = result;
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
