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

///Getting instance of getit for dependency injection
GetIt locator = GetIt.instance;

///Here we are creating singletons of our dependencies and repositories
///and injecting to respective implementations
class AppInjector {
  ///This configure will be called in main after ensureinitialized to setup our
  ///dependency injection, here we can add various function calls like creating
  ///dio instances for http calls according to the flavors, for example injecting
  ///different baseurl's based on the flavors, injecting firebase analytics based
  ///on the flavor etc.
  static Future<void> configure() async {
    ///creating sharedpreference instance and creating sharedpreference helper
    ///classes inspired from my mapetit base project structure
    final sharedPreferences = await SharedPreferences.getInstance();
    locator.registerLazySingleton<SharedPrefHelper>(
      () => SharedPrefHelperImpl(pref: sharedPreferences),
    );

    ///The local drift Db is getting initialised as a singleton
    locator.registerLazySingleton(() => IPotatoDatabase());

    ///The audio player instance is created as a singleton
    locator.registerLazySingleton(() => AssetsAudioPlayer());

    ///Db instance is injected to Db Helper class we just need to inject the
    ///locator() as we already created the singleton of the Db instance
    locator.registerLazySingleton<DatabaseHelper>(
      () => DatabaseHelperImpl(
        dbInstance: locator(),
      ),
    );

    ///Db instance and audio player singletons are getting injected to task
    ///repository
    locator.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(
        databaseHelperInstance: locator(),
        assetsAudioPlayer: locator(),
      ),
    );
  }
}
