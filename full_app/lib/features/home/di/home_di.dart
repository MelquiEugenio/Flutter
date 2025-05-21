import 'package:full_app/features/home/presentation/state/home_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class HomeDI {
  static void initializeHomeDI() {
    getIt.registerFactory<HomeStore>(() => HomeStore());
  }

  static void unregisterHomeDI() {
    if (getIt.isRegistered<HomeStore>()) {
      getIt.unregister<HomeStore>();
    }
  }
}