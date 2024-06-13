import 'package:http/http.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/services/network_service/base_api_service.dart';
import 'package:navttc/src/services/network_service/response_handlers.dart';
import 'package:navttc/src/services/registry_service/get_it.dart';

class ApiClient implements BaseApiService {
  final _http = locator<Client>();
  final _handler = locator<ResponseHandlers>();

  @override
  Future requestGET({
    required String route,
    Map<String, String>? headers,
  }) async {
    try {
      appLog(
        "\n***REQUESTING GET on route***: @$route "
            "\n***Headers: $headers",
      );

      Response response = await _http.get(
        Uri.parse(route),
        headers: headers,
      );
      appPrint("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = _handler.filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      if (result is Exception) {
        throw result;
      }
      return result;
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestPOST({
    required String route,
    Object? data,
    Map<String, String>? headers,
  }) async {
    try {
      appLog(
        "\n***REQUESTING***: @$route "
            "\n***Payload:$data"
            "\n***Headers: $headers",
      );

      Response response = await _http.post(
        Uri.parse(route),
        headers: headers,
        body: data,
      );
      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = _handler.filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      if (result is Exception) {
        throw result;
      }
      return result;
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestDELETE({
    required String route,
    Object? data,
    Map<String, String>? headers,
  }) async {
    try {
      appLog(
        "\n***REQUESTING GET on route***: @$route "
            "\n***Headers: $headers",
      );

      Response response = await _http.delete(
        Uri.parse(route),
        headers: headers,
      );
      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = _handler.filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      if (result is Exception) {
        throw result;
      }
      return result;
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestPUT({required String route, Object? data}) {
    throw UnimplementedError();
  }
}
