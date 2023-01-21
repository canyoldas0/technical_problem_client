import 'package:technical_problem_client/network/base_models/network_response.dart';
import 'package:technical_problem_client/network/network_manager.dart';
import 'package:technical_problem_client/network/token_repository.dart';

class UserService {
  void login(String email, String password) async {
    LoginRequest requestBody = LoginRequest(email, password);

    NetworkResponse? response = await NetworkManager()
        .apiCall("/login", null, requestBody.toJson(), RequestType.POST);

    print(response);
  }

  Future<LoginResponse?> refresh() async {
    NetworkResponse? response = await NetworkManager().apiCall(
        "/login",
        null,
        {
          "refresh_token": TokenRepository().accessTokenKey,
        },
        RequestType.POST);

    return LoginResponse("1231231");
  }
}

class LoginResponse {
  final String accessToken;

  LoginResponse(this.accessToken);
}
