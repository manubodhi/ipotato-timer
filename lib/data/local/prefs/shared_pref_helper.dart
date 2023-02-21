abstract class SharedPrefHelper {
  Future<bool> clear();

  Future<bool> setUserToken(String? token);

  String? get userToken;

  Future<bool> setRefreshToken(String? token);

  String? get refreshToken;
}
