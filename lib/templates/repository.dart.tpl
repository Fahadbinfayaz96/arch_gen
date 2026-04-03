import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/{{snake}}_entity.dart';

abstract class {{Feature}}Repository {
  Future<Either<Failure, List<{{Feature}}Entity>>> get{{Feature}}();
}