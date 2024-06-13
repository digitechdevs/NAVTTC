import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/services/local_db_service/shared_prefs.dart';
import 'package:navttc/src/services/network_service/api_service.dart';
import 'package:navttc/src/services/network_service/response_handlers.dart';

final locator = GetIt.instance;

setupLocator() {
  appPrint("***Setup Registry***");
  locator.registerLazySingleton(() => Prefs());
  locator.registerLazySingleton(() => Client());
  locator.registerLazySingleton(() => ApiClient());
  locator.registerLazySingleton(() => ResponseHandlers());
  locator.registerLazySingleton(() => const FlutterSecureStorage());
}
