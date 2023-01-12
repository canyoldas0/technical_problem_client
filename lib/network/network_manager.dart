import 'package:dio/dio.dart';
import 'dart:convert';

class NetworkManager {
  final String baseUrl = "http://localhost:3000/";
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
