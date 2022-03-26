import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:website/navigation/navigation.dart';

import 'exported_services.dart';
export 'exported_services.dart';

final get = GetIt.instance.get;

AppRouter get router => get<AppRouter>();

final _testing = Platform.environment.containsKey('FLUTTER_TEST');

class Services {
  static bool _initialized = false;

  static init() async {
    if (_initialized) return;
    if (_testing) {
      await _initTesting();
    } else {
      await _init();
    }
    _initialized = true;
  }

  static Future _init() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton(AppRouter());

    getIt.registerSingleton(Api());

    getIt.registerFactory<AudioPlayer>(() => JustAudioAudioPlayer());
  }

  static Future _initTesting() async {
    return _init(); // TODO
  }
}
