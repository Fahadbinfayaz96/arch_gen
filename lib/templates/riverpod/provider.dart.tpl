import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/{{snake}}_usecase.dart';
import '../../domain/entities/{{snake}}_entity.dart';

final {{snake}}NotifierProvider = NotifierProvider<{{Feature}}Notifier, {{Feature}}State>(
  {{Feature}}Notifier.new,
);

class {{Feature}}State {
  final bool isLoading;
  final String? error;
  final List<{{Feature}}Entity> items;

  const {{Feature}}State({
    this.isLoading = false,
    this.error,
    this.items = const [],
  });

  {{Feature}}State copyWith({
    bool? isLoading,
    String? error,
    List<{{Feature}}Entity>? items,
  }) {
    return {{Feature}}State(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}

class {{Feature}}Notifier extends Notifier<{{Feature}}State> {
  late final {{Feature}}UseCase useCase;

  @override
  {{Feature}}State build() {
    useCase = sl<{{Feature}}UseCase>();
    return const {{Feature}}State();
  }

  Future<void> fetchItems() async {
    state = state.copyWith(isLoading: true);

    final result = await useCase(NoParams());

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
      (data) => state = state.copyWith(
        isLoading: false,
        items: data,
      ),
    );
  }
}