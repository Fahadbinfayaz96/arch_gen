class ArchGenConfig {
  final String stateManagement;
  final bool useEquatable;

  ArchGenConfig({required this.stateManagement, required this.useEquatable});

  factory ArchGenConfig.fromYaml(Map yaml) {
    return ArchGenConfig(
      stateManagement: yaml['state_management'] ?? 'bloc',
      useEquatable: yaml['use_equatable'] ?? true,
    );
  }

  ArchGenConfig copyWith({String? stateManagement, bool? useEquatable}) {
    return ArchGenConfig(
      stateManagement: stateManagement ?? this.stateManagement,
      useEquatable: useEquatable ?? this.useEquatable,
    );
  }
}
