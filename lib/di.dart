import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/local_repository.dart';
import 'features/home/home_provider.dart';
import 'utils_and_services/routing/navigation_service.dart';

/// sl: service locator
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<LocalRepo>(
    () => LocalRepo(
      sharedPreferences: sl(),
    ),
  );

  // sl.registerLazySingleton<ApiRepo>(
  //   () => ApiRepo(
  //     client: sl(),
  //   ),
  // );

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Dio client = Dio(
  //   BaseOptions(
  //     baseUrl: 'https://amberrestaurant.no/demo/api/',
  //     contentType: 'application/json',
  //   ),
  // );
  // sl.registerLazySingleton<Dio>(() => client);

  sl.registerLazySingleton(() => HomeProvider());
  // sl.registerLazySingleton(() => LandingProvider());
  // sl.registerLazySingleton(() => AuthProvider());
  // sl.registerLazySingleton(() => MealDetailsProvider());
  // sl.registerLazySingleton(() => ProfileProvider());
  // sl.registerLazySingleton(() => CartProvider());
  // sl.registerLazySingleton(() => PreAppProvider());

  sl.registerLazySingleton(() => NavigationService());

  // await refreshToken();
}

// refreshToken() async {
//   final String token = sl<LocalRepo>().getUser()?.token;
//   sl<Dio>().options.headers = {'Authorization': 'Bearer $token'};
//   print('refreshToken: $token');
// }
