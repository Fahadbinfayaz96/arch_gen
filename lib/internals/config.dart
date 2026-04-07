/// Configuration for the code generator.
///
/// Loaded from `arch_gen.yaml` in the project root.
library;

class ArchGenConfig {
  /// State management solution: 'bloc' or 'riverpod'
  final String stateManagement;

  /// Whether to use Equatable package with BLoC
  final bool useEquatable;

  /// Creates a new configuration instance.
  ArchGenConfig({required this.stateManagement, required this.useEquatable}) {
    if (stateManagement != 'bloc' && stateManagement != 'riverpod') {
      throw ArgumentError(
        'stateManagement must be "bloc" or "riverpod", got "$stateManagement"',
      );
    }
  }

  factory ArchGenConfig.fromYaml(Map yaml) {
    final stateManagement = yaml['state_management']?.toString();
    final useEquatable = yaml['use_equatable'] as bool?;

    return ArchGenConfig(
      stateManagement: stateManagement ?? 'bloc',
      useEquatable: useEquatable ?? true,
    );
  }

  ArchGenConfig copyWith({String? stateManagement, bool? useEquatable}) {
    return ArchGenConfig(
      stateManagement: stateManagement ?? this.stateManagement,
      useEquatable: useEquatable ?? this.useEquatable,
    );
  }

  @override
  String toString() {
    return 'ArchGenConfig(stateManagement: $stateManagement, useEquatable: $useEquatable)';
  }
}
