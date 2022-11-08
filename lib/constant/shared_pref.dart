import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {

  Future<void> setString(String responseString, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, responseString);
  }


  Future<String> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String getValue = prefs.getString(key)!;
    return getValue;
  }
  Future<void> setStringList(List<String> responseString, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, responseString);
  }

  Future<List<String>> getStringList(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> getValue = prefs.getStringList(key)!;
    return getValue;
  }

  Future<void> setBool(String key, bool data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, data);
  }

  Future<bool> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool updated = prefs.getBool(key) ?? false;
    return updated;
  }

  Future<void> setInt(String key, int data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, data);
  }

  Future<int> getInt(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int updated = prefs.getInt(key)!;
    return updated;
  }

  Future<void> remove(removekey) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(removekey);
  }
}