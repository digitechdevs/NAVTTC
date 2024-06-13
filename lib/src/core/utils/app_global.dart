import 'package:navttc/src/core/utils/app_exports.dart';

bool globalHasInternetConnection = true;
Map<String, String> tokenHeaders = {};

Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

void globalSet(bool key) {
  globalHasInternetConnection = key;
}

globalConnection(BuildContext context) {
  return globalHasInternetConnection;
}

globalHeaderSet(String key) {
  appPrint(key);
  tokenHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': key == ""
        ? "Bearer 19|lOpP33HSafxnXRiGpiazXWS1EgUalzSzAQKIQ81b"
        : "Bearer $key",
  };
  return tokenHeaders;
}

globalHeader(String key) {
  appPrint(key);
  tokenHeaders = {
    'Accept': 'application/json',
    'Authorization': key == ""
        ? "Bearer 19|lOpP33HSafxnXRiGpiazXWS1EgUalzSzAQKIQ81b"
        : "Bearer $key",
  };
  return tokenHeaders;
}

Map<String, String> globalHeaderGet() {
  return tokenHeaders;
}
