import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICacheService {
  Future<void> write(String key, String value);
  String? read(String key);
  Future<bool> delete(String key);
  Future<bool> contains(String key);
  Future<void> clear();
}

@LazySingleton(as: ICacheService)
class CacheService implements ICacheService {
  final SharedPreferences _prefs;

  CacheService(this._prefs);

  @override
  Future<void> write(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  String? read(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<bool> delete(String key) async {
    return await _prefs.remove(key);
  }

  @override
  Future<bool> contains(String key) async {
    return _prefs.containsKey(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}
