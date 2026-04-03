import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/{{snake}}_repository.dart';
import '../entities/{{snake}}_entity.dart';

class {{Feature}}UseCase implements UseCase<List<{{Feature}}Entity>, NoParams> {
  final {{Feature}}Repository repository;

  {{Feature}}UseCase(this.repository);

  @override
  Future<Either<Failure, List<{{Feature}}Entity>>> call(NoParams params) async {
    return await repository.get{{Feature}}();
  }
}