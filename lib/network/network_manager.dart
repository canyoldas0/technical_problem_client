import 'package:dio/dio.dart';

import 'auth_interceptor.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkManager {
  final String baseUrl = "http://localhost:3000/";

  // Temporary headers.
  Options options = Options(headers: {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'client-secret': 'xyz',
    'client-id': 'xyz',
    'package-name': 'com.abc.abc',
    'platform': 'android',
    'Authorization': "eyJ0eXAiOiJKV1QiLCJhdhsdhjd"
  });

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

  // not gonna be void.
  void makeCall(Encodable request) {
    Map<String, dynamic> body = request.toJson();
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
