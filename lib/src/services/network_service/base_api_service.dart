abstract class BaseApiService {
  Future requestGET({required String route});

  Future requestPOST({required String route, Object? data});

  Future requestPUT({required String route, Object? data});

  Future requestDELETE({required String route, Object? data});
}
