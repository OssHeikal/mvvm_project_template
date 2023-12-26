import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';

// run this command to generate the injection file
// dart run build_runner build 

/// sl is the service locator used throughout the app
final GetIt sl = GetIt.instance;

// configureInjection is the function that will be called from main.dart
@InjectableInit(initializerName: r'$initGetIt', preferRelativeImports: true, asExtension: false)
Future<GetIt> configureInjection() async => $initGetIt(sl);

// RegisterModule contains all the global dependencies
@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();
  @lazySingleton
  FlutterSecureStorage get secureStorage =>
      const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
