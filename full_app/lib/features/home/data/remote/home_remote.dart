import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:full_app/features/home/data/models/repository_model.dart';
import 'package:full_app/features/home/data/remote/home_remote_interface.dart';

class HomeRemote implements HomeRemoteInterface {
  final DioForNative dio;

  HomeRemote(this.dio);

  @override
  Future<List<RepositoryModel>> getRepositories(String username) async {
    try {
      final response = await dio.get('/users/$username/repos');

      final List data = response.data as List;
      return data.map((e) => RepositoryModel.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('User not found');
      }
      throw Exception('Failed to load repositories: ${e.message}');
    }
  }
}
