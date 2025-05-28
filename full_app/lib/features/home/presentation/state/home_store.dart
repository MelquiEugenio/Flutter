import 'package:full_app/core/di/global_di.dart';
import 'package:full_app/features/home/domain/entity/repository_entity.dart';
import 'package:full_app/features/home/domain/usecases/get_repos_usecase.dart';
import 'package:full_app/features/home/domain/usecases/get_repos_usecase_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final GetReposUsecaseInterface _getReposUsecase = getIt.get<GetReposUsecase>();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  ObservableList<Repository> repos = ObservableList<Repository>.of([]);

  @action
  Future<void> fetchRepositories(String username) async {
    isLoading = true;
    errorMessage = '';
    repos.clear();

    final result = await _getReposUsecase(username);

    result.fold(
      (Exception failure) {
        errorMessage = failure.toString();
        print('ERROR >>>>>>>>>>>>>>> $errorMessage');
      },
      (List<Repository> repos) {
        this.repos.addAll(repos);
      },
    );

    isLoading = false;
  }
}