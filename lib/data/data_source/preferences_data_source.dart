import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesDataSource {
  Future<int> getInt(String key, int defaultvalue);
  Future<String> getString(String key, String defaultvalue);
  Future<void> setInt(String key, int value);
  Future<void> setString(String key, String value);
}

class PreferencesDataSourceImpl extends PreferencesDataSource {
  PreferencesDataSourceImpl({Future<SharedPreferences>? sharedPreferences,})
      : _sharedPreferences =
            sharedPreferences ?? SharedPreferences.getInstance();

  final Future<SharedPreferences> _sharedPreferences;

  @override
  Future<int> getInt(String key, int defaultvalue) async =>
      (await _sharedPreferences).getInt(key) ?? defaultvalue;

  @override
  Future<String> getString(String key, String defaultvalue) async =>
      (await _sharedPreferences).getString(key) ?? defaultvalue;

  @override
  Future<void> setInt(String key, int value) async =>
      (await _sharedPreferences).setInt(key, value);

  @override
  Future<void> setString(String key, String value) async =>
      (await _sharedPreferences).setString(key, value);
}
