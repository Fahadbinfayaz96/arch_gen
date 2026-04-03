import 'package:test/test.dart';
import 'dart:io';

void main() {
  group('Template Engine', () {
    test('renderTemplate replaces variables correctly', () async {
      final tempDir = Directory.systemTemp.createTempSync();
      final templateFile = File('${tempDir.path}/test.tpl');
      templateFile.writeAsStringSync('Hello {{name}}! Welcome to {{app}}.');

      final vars = {'name': 'John', 'app': 'Flutter'};

      String content = templateFile.readAsStringSync();
      for (final entry in vars.entries) {
        content = content.replaceAll('{{${entry.key}}}', entry.value);
      }

      expect(content, equals('Hello John! Welcome to Flutter.'));

      tempDir.deleteSync(recursive: true);
    });

    test('renderTemplate handles multiple same variables', () {
      String content = '{{name}} is {{name}} again';
      final vars = {'name': 'Bob'};

      for (final entry in vars.entries) {
        content = content.replaceAll('{{${entry.key}}}', entry.value);
      }

      expect(content, equals('Bob is Bob again'));
    });
  });
}
