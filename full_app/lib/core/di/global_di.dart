import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class GlobalDI {
  static void initializeGlobalDI() {
    getIt.registerLazySingleton<DioForNative>(
      () => DioForNative(
        BaseOptions(
          baseUrl: 'https://api.github.com',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ),
    );
  }
}
