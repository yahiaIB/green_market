import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static PreferenceUtils _instance;
  static SharedPreferences _preferences;

  static const String UserKey = 'user';
  static const String UserToken = 'token';
  static const String UserId = 'id';
  static const String UserRoles = 'roles';

  static PreferenceUtils getInstance() {
    if (_instance == null) {
      _instance = PreferenceUtils();
    }
    return _instance;
  }

  static init() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  static initSharedPreference() {}

  dynamic getData(String key) {
    var value = _preferences.get(key);
    print('PreferenceUtils: getData. key: $key value: $value');
    return value;
  }

  dynamic saveStringData<T>(String key, T content) {
    print('PreferenceUtils: saveStringData. key: $key value: $content');
    if (content is String) {
      _preferences.setString(key, content);
    }
  }


  Future<void> removeWithKey(String key) async {
    await _preferences.remove(key);
  }

  Future<void> clearAll() async {
    await _preferences.clear();
  }
}
