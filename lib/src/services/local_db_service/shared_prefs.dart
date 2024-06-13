import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:navttc/src/services/registry_service/get_it.dart';

class Prefs {

  ///
  /// Pref Keys
  ///
  static const String _kUser = "user";
  static const String clockStatus = "clockStatus";
  static const String kAttendanceId = "attendanceId";

  final _secureStorage = locator<FlutterSecureStorage>();

  Future<void> store(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteUser() async {
    await _secureStorage.delete(key: _kUser);
  }

  Future<void> clearStorage() async {
    await _secureStorage.deleteAll();
  }
}
