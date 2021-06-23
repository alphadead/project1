import 'package:get_it/get_it.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/api/fake_api.dart';
import 'package:vamos/core/service/api/http_api.dart';
import 'package:vamos/core/service/authentication_service.dart';

GetIt locator = GetIt.instance;
const bool USE_FAKE_IMPLEMENTATION = false;
void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton<Api>(
      () => USE_FAKE_IMPLEMENTATION ? FakeApi() : HTTPApi());
}
