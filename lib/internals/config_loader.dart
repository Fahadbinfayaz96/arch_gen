import 'dart:io';
import 'package:yaml/yaml.dart';
import 'config.dart';

ArchGenConfig loadConfig() {
  final file = File('arch_gen.yaml');

  if (!file.existsSync()) {
    return ArchGenConfig(stateManagement: 'bloc', useEquatable: true);
  }

  final content = file.readAsStringSync();
  final yamlMap = loadYaml(content);

  return ArchGenConfig.fromYaml(yamlMap);
}
