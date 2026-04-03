import 'dart:io';

const Map<String, String> packageVersions = {
  'flutter_bloc': '^8.1.0',
  'equatable': '^2.0.5',
  'flutter_riverpod': '^2.4.0',
  'dartz': '^0.10.1',
  'get_it': '^7.6.0',
  'http': '^1.1.0',
  'hive': '^2.2.3',
  'hive_flutter': '^1.1.0',
  'connectivity_plus': '^5.0.0',
};

void ensureDependencies(List<String> packages) {
  final pubspec = File('pubspec.yaml');

  if (!pubspec.existsSync()) {
    print("⚠️ pubspec.yaml not found");
    return;
  }

  String content = pubspec.readAsStringSync();
  bool updated = false;

  for (var pkg in packages) {
    if (!content.contains(pkg)) {
      final version = packageVersions[pkg] ?? '^1.0.0';
      final dependencyLine = "  $pkg: $version\n";

      // Find where to insert dependencies
      if (content.contains('dependencies:')) {
        // Insert after dependencies: line
        content = content.replaceFirst(
          RegExp(r'dependencies:\s*\n'),
          'dependencies:\n$dependencyLine',
        );
        updated = true;
        print("📦 Added $pkg: $version");
      }
    }
  }

  if (updated) {
    pubspec.writeAsStringSync(content);
    print("📦 Running flutter pub get...");
    final result = Process.runSync('flutter', ['pub', 'get']);
    if (result.exitCode == 0) {
      print("✅ Dependencies installed");
    } else {
      print("❌ Failed to run flutter pub get");
      print(result.stderr);
    }
  }
}
