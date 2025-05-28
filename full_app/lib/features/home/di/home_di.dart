import 'package:full_app/features/home/data/remote/home_remote.dart';
import 'package:full_app/features/home/data/repository/home_repository.dart';
import 'package:full_app/features/home/domain/usecases/get_repos_usecase.dart';
import 'package:full_app/features/home/presentation/state/home_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class HomeDI {
  static void initializeHomeDI() {
    if (!getIt.isRegistered<HomeRemote>()) {
      getIt.registerFactory<HomeRemote>(() => HomeRemote(getIt()));
    }
    if (!getIt.isRegistered<HomeRepository>()) {
      getIt.registerFactory<HomeRepository>(
        () => HomeRepository(homeRemote: getIt.get<HomeRemote>()),
      );
    }
    if (!getIt.isRegistered<GetReposUsecase>()) {
      getIt.registerFactory<GetReposUsecase>(
        () => GetReposUsecase(homeRepository: getIt.get<HomeRepository>()),
      );
    }

    if (!getIt.isRegistered<HomeStore>()) {
      getIt.registerFactory<HomeStore>(() => HomeStore());
    }
  }

  static void unregisterHomeDI() {
    if (getIt.isRegistered<HomeStore>()) {
      getIt.unregister<HomeStore>();
    }
    if (getIt.isRegistered<GetReposUsecase>()) {
      getIt.unregister<GetReposUsecase>();
    }
    if (getIt.isRegistered<HomeRepository>()) {
      getIt.unregister<HomeRepository>();
    }
    if (getIt.isRegistered<HomeRemote>()) {
      getIt.unregister<HomeRemote>();
    }
  }
}
