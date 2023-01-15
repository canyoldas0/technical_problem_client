import 'package:dio/dio.dart';

import 'base_models/network_response.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging.dart';

final Map<String, String> header = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'client-secret': 'xyz',
  'client-id': 'abc',
  'package-name': 'com.sasa.abc',
  'platform': 'android',
  'Authorization': "access_token"
};

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkManager {
  final String baseUrl = "http://localhost:3000/";

  final dio = createDio();

  NetworkManager._internal();

  static final _singleton = NetworkManager._internal();

  factory NetworkManager() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "http://localhost:3000/",
      receiveTimeout: 20000,
      connectTimeout: 20000,
      sendTimeout: 20000,
    ));

    dio.interceptors.addAll({
      AuthInterceptor(dio),
    });

    dio.interceptors.addAll({
      Logging(dio),
    });

    return dio;
  }

  Future<NetworkResponse?> apiCall(
      String url,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body,
      RequestType requestType) async {
    late Response result;
    try {
      switch (requestType) {
        case RequestType.GET:
          {
            Options options = Options(headers: header);
            result = await dio.get(url,
                queryParameters: queryParameters, options: options);
            break;
          }
        case RequestType.POST:
          {
            Options options = Options(headers: header);
            result = await dio.post(url, data: body, options: options);
            break;
          }
        case RequestType.DELETE:
          {
            Options options = Options(headers: header);
            result =
                await dio.delete(url, data: queryParameters, options: options);
            break;
          }
      }
      if (result != null) {
        return NetworkResponse.success(result.data);
      } else {
        return const NetworkResponse.error("Data is null");
      }
    } on DioError catch (error) {
      return NetworkResponse.error(error.message);
    } catch (error) {
      return NetworkResponse.error(error.toString());
    }
  }
}

abstract class Encodable {
  Map<String, dynamic> toJson();
}

class LoginRequest implements Encodable {
  final String email;
  final String password;

  LoginRequest(this.email, this.password);

  @override
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
