import 'package:dio/dio.dart';
import 'dart:convert';

class NetworkManager {
  final String baseUrl = "http://localhost:3000/";

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
