import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato/data/local/db/database_helper.dart';
import 'package:ipotato/data/local/db/database_helper_impl.dart';
import 'package:ipotato/data/local/db/ipotato_db.dart';
import 'package:ipotato/data/local/prefs/shared_pref_helper.dart';
import 'package:ipotato/data/local/prefs/shared_pref_helper_impl.dart';
import 'package:ipotato/data/repos/task_repository.dart';
import 'package:ipotato/data/repos/task_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

class AppInjector {
  static Future<void> configure() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    locator.registerLazySingleton<SharedPrefHelper>(
      () => SharedPrefHelperImpl(pref: sharedPreferences),
    );

    locator.registerLazySingleton(() => IPotatoDatabase());

    locator.registerLazySingleton<DatabaseHelper>(
      () => DatabaseHelperImpl(
        dbInstance: IPotatoDatabase(),
      ),
    );

    locator.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(
        databaseHelperInstance: locator(),
        assetsAudioPlayer: AssetsAudioPlayer(),
      ),
    );
  }
}
