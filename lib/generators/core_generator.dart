import 'dart:io';

import 'package:arch_gen/untils/files_utils.dart';

void generateCore() {
  final coreDirs = [
    'lib/core/error',
    'lib/core/network',
    'lib/core/utils',
    'lib/core/usecase',
  ];

  for (var dir in coreDirs) {
    Directory(dir).createSync(recursive: true);
  }

  safeWrite('lib/core/error/failure.dart', _failureContent());

  safeWrite('lib/core/error/exceptions.dart', _exceptionsContent());

  safeWrite('lib/core/network/api_client.dart', _apiClientContent());

  safeWrite('lib/core/usecase/usecase.dart', _usecaseContent());

  print("📦 Core generated");
}

String _failureContent() => '''
abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
''';

String _exceptionsContent() => '''
class ServerException implements Exception {}

class CacheException implements Exception {}
''';

String _apiClientContent() => '''
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;

  ApiClient(this.client);

  Future<dynamic> get(String url) async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data");
    }
  }
}
''';

String _usecaseContent() => '''
import 'package:dartz/dartz.dart';
import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// For usecases without params
class NoParams {}
''';
