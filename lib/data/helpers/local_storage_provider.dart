import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static LocalStorageService get instance {
    _instance ??= LocalStorageService._();
    return _instance!;
  }

  late GetStorage _storageBox;

  void _init() async {
    _storageBox = GetStorage();
  }

  LocalStorageService._() {
    _init();
  }
  Future<void> addNew(String key, dynamic value) async {
    await _storageBox.write(key, value);
  }

  // Future<dynamic> get(String key) async {
  //   return await _storageBox.read(key);
  // }
  dynamic get(dynamic key) {
    return _storageBox.read(key);
  }

  Future<void> remove(String key) async {
    await _storageBox.remove(key);
  }
}
