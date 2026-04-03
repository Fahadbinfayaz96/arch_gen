// import 'dart:io';

// void initCommand() {
//   final file = File('arch_gen.yaml');

//   if (!file.existsSync()) {
//     file.writeAsStringSync('''
// state_management: bloc
// use_equatable: true
// ''');
//   }

//   final coreDirs = ['lib/core/error', 'lib/core/network', 'lib/core/utils'];

//   for (var dir in coreDirs) {
//     Directory(dir).createSync(recursive: true);
//   }

//   print("✅ Project initialized");
// }
