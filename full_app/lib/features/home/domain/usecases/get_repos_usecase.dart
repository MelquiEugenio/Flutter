import 'package:dartz/dartz.dart';
import 'package:full_app/features/home/domain/entity/repository_entity.dart';
import 'package:full_app/features/home/domain/repository/home_repository_interface.dart';
import 'package:full_app/features/home/domain/usecases/get_repos_usecase_interface.dart';

class GetReposUsecase implements GetReposUsecaseInterface {
  final HomeRepositoryInterface homeRepository;

  GetReposUsecase({required this.homeRepository});

  @override
  Future<Either<Exception, List<Repository>>> call(String username) async {
    if (username.isEmpty) {
      return left(Exception('Username is empty'));
    }
    return homeRepository.getRepositories(username);
  }
}
