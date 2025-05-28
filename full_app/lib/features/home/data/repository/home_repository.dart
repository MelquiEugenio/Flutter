import 'package:dartz/dartz.dart';
import 'package:full_app/features/home/data/remote/home_remote_interface.dart';
import 'package:full_app/features/home/domain/entity/repository_entity.dart';
import 'package:full_app/features/home/domain/repository/home_repository_interface.dart';

class HomeRepository implements HomeRepositoryInterface {
  final HomeRemoteInterface homeRemote;

  HomeRepository({required this.homeRemote});

  @override
  Future<Either<Exception, List<Repository>>> getRepositories(String username) async {
    try {
      final repositories = await homeRemote.getRepositories(username);
      return right(repositories);
    } catch (e) {
      return left(e as Exception);
    }
  }
}
