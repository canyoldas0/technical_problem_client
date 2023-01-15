import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenRepository {
  FlutterSecureStorage storage = FlutterSecureStorage();

  final String accessTokenKey = "com.technical_problem.access.token";

  AndroidOptions _secureOption() => AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future getAccessToken() async {
    return await storage.read(
      key: accessTokenKey,
      aOptions: _secureOption(),
    );
  }

  //TODO: save access token
  persistAccessToken(accessToken) {}

  //TODO: get remaining time
  getAccessTokenRemainingTime() {}
}
