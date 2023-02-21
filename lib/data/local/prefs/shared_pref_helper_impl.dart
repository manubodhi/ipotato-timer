import 'package:ipotato/data/local/prefs/shared_pref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Sharedpreference is manages through this class
class SharedPrefHelperImpl extends SharedPrefHelper {
  final SharedPreferences pref;

  static const _PREF_USER_TOKEN = 'PREF_USER_TOKEN';
  static const _PREF_REFRESH_TOKEN = 'PREF_REFRESH_TOKEN';

  SharedPrefHelperImpl({required this.pref});

  @override
  Future<bool> clear() async => await pref.clear();

  @override
  String? get userToken => pref.getString(_PREF_USER_TOKEN);

  @override
  Future<bool> setUserToken(String? token) =>
      pref.setString(_PREF_USER_TOKEN, token!);

  @override
  String? get refreshToken => pref.getString(_PREF_REFRESH_TOKEN);

  @override
  Future<bool> setRefreshToken(String? token) =>
      pref.setString(_PREF_REFRESH_TOKEN, token!);
}
