import 'package:full_app/features/home/domain/entity/repository_entity.dart';

class RepositoryModel extends Repository {

  RepositoryModel({
    required super.name,
    required super.language,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'],
      language: json['language'],
    );
  }
}
