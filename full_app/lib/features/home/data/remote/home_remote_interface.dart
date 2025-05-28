import 'package:full_app/features/home/data/models/repository_model.dart';

abstract class HomeRemoteInterface {
  Future<List<RepositoryModel>> getRepositories(String username);
}
