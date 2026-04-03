import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/{{snake}}_repository.dart';
import '../datasources/{{snake}}_remote_datasource.dart';
import '../../domain/entities/{{snake}}_entity.dart';

class {{Feature}}RepositoryImpl implements {{Feature}}Repository {
  final {{Feature}}RemoteDataSource remoteDataSource;

  {{Feature}}RepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<{{Feature}}Entity>>> get{{Feature}}() async {
    try {
      final result = await remoteDataSource.get{{Feature}}();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure("Server Error"));
    }
  }
}