import 'package:courseapp/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this is a singleton class
// by singleton we make sure that your class is only one instance.
class StorageService {
  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    // _prefs is the only instance and it has global pointer.
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }
}
