import 'dart:io';

String renderTemplate(String templatePath, Map<String, String> vars) {
  final file = File(templatePath);

  if (!file.existsSync()) {
    throw Exception('Template not found: $templatePath');
  }

  String content = file.readAsStringSync();

  vars.forEach((key, value) {
    content = content.replaceAll('{{$key}}', value);
  });

  return content;
}
