import 'package:dio/dio.dart';
import 'dart:convert';

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

  // not gonna be void.
  // TODO: Make generic network call.
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
