import 'package:budgetkp/core/services/http_service.dart';
import 'package:get_it/get_it.dart';

import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<HttpService>(
    () => HttpService(),
  );

  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
}
