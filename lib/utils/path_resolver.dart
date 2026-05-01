import 'dart:io';
import 'dart:isolate';
import 'package:path/path.dart' as path;

class PathResolver {
  static Future<String> getTemplatePath(String relativePath) async {
    final uri = await Isolate.resolvePackageUri(
      Uri.parse('package:fd_arch_gen/'),
    );

    if (uri == null) {
      throw Exception('Could not resolve fd_arch_gen package');
    }

    final packageRoot = Directory.fromUri(uri).path;

    final templatePath = path.join(packageRoot, 'templates', relativePath);

    if (!File(templatePath).existsSync()) {
      throw Exception('Template not found: $relativePath');
    }

    return templatePath;
  }
}
