import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/{{feature_snake}}_usecase.dart';

part '{{feature_snake}}_event.dart';
part '{{feature_snake}}_state.dart';

class {{Feature}}Bloc extends Bloc<{{Feature}}Event, {{Feature}}State> {
  final {{Feature}}UseCase useCase;

  {{Feature}}Bloc(this.useCase) : super({{Feature}}Initial()) {
    on<{{Feature}}Started>(_onStarted);
  }

  void _onStarted(
    {{Feature}}Started event,
    Emitter<{{Feature}}State> emit,
  ) {
    // TODO: Implement
  }
}