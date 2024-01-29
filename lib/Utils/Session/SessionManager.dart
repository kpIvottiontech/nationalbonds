import 'dart:convert';
import 'package:national_bonds_app/Models/Response/LoginResponse/LoginResponse.dart';
import 'package:national_bonds_app/Models/Response/LoginResponse/TokenResponse.dart';
import 'package:national_bonds_app/Utils/Session/NullCheckOperations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  // set string values in shared pref
  static Future<void> setStringValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<void> setStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  static Future<List<String>> getStringList(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList(key) ?? [];
  }

  // get string values in shared pref
  static Future<String> getStringValue(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? "";
  }

  // set bool values in shared pref
  static Future<void> setBoolValue(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  // get bool values in shared pref
  static Future<bool> getBoolValue(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key) ?? false;
  }

  // set int values in shared pref
  static Future<void> setIntValue(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  // get int values in shared pref
  static Future<int> getIntValue(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(key) ?? 0;
  }

  // set long values in shared pref
  static Future<void> setDoubleValue(String key, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  // get long values in shared pref
  static Future<double> getDoubleValue(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble(key) ?? 0.0;
  }

  // get long values in shared pref
  static Future<double> getDoubleValueFont(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble(key) ?? 1.0;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<bool> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<void> setTokenResponse(TokenResponse response) async {
    await SessionManager.setStringValue(
        "tokenResponse", json.encode(response.toJson()));
  }

  static Future<TokenResponse?> getTokenResponse() async {
    String response = await SessionManager.getStringValue("tokenResponse");
    if (CheckNullData.checkNullOrEmptyString(response)) {
      return null;
    } else {
      return TokenResponse.fromJson(json.decode(response));
    }
  }

  static Future<void> setAuthResponse(LoginResponse response) async {
    await SessionManager.setStringValue(
        "authResponse", json.encode(response.toJson()));
  }

  static Future<LoginResponse?> getAuthResponse() async {
    String response = await SessionManager.getStringValue("authResponse");
    if (CheckNullData.checkNullOrEmptyString(response)) {
      return null;
    } else {
      return LoginResponse.fromJson(json.decode(response));
    }
  }
}
