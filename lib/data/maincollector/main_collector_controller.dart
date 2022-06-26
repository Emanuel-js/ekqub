import 'package:ekub/data/maincollector/main_collector_repo.dart';
import 'package:ekub/data/subcollector/sub_collector_model.dart';
import 'package:ekub/utils/message_widet.dart';
import 'package:get/get.dart';

class MainCollectorController extends GetxController {
  final _isLoading = false.obs;
  final _isRegisterd = false.obs;

  bool get isLoading => _isLoading.value;
  bool get isRegisterd => _isRegisterd.value;

  void setLoading(bool show) {
    _isLoading.value = show;
  }

  registerSubCollector(SubCollectorModel data) async {
    setLoading(true);

    try {
      final res = await ManiCollectorRepo().registerSubCollector(data);
      if (res != null) {
        _isRegisterd.value = true;
        setLoading(false);
        displayMessage(
            title: "Message", msg: "${res["firstName"]} በተሳካ ሁኔታ ተመዝግቧል");
      }
    } catch (e) {
      _isRegisterd.value = false;
      setLoading(false);
    }
    return _isRegisterd.value;
  }
}
