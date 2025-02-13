import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const String _prefix = 'cache_';

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  T get<T>(String key) {
    return _prefs.get('$_prefix$key') as T;
  }

  Future<void> set(String key, dynamic value) async {
    await _prefs.setStringList('$_prefix$key', value);

    // switch (value) {
    //   case (:List<String> value):
    //     {
    //       await _prefs.setStringList('$_prefix$key', value);
    //       break;
    //     }
    //   case (:String value):
    //     {
    //       await _prefs.setString('$_prefix$key', value);
    //       break;
    //     }
    //   case (:bool value):
    //     {
    //       await _prefs.setBool('$_prefix$key', value);
    //       break;
    //     }
    //   case (:int value):
    //     {
    //       await _prefs.setInt('$_prefix$key', value);
    //       break;
    //     }
    //   case (:double value):
    //     {
    //       await _prefs.setDouble('$_prefix$key', value);
    //       break;
    //     }
    // }
  }
}
