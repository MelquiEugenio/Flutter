import 'package:dartz/dartz.dart';
import 'package:full_app/features/home/domain/entity/repository_entity.dart';

abstract class GetReposUsecaseInterface {
  Future<Either<Exception, List<Repository>>> call(String username);
}