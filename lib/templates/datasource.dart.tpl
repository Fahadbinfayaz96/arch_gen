import '../models/{{snake}}_model.dart';

abstract class {{Feature}}RemoteDataSource {
  Future<List<{{Feature}}Model>> get{{Feature}}();
}

class {{Feature}}RemoteDataSourceImpl implements {{Feature}}RemoteDataSource {
  @override
  Future<List<{{Feature}}Model>> get{{Feature}}() async {
    // TODO: call API
    return [];
  }
}