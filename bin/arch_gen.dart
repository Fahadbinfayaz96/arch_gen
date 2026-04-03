import 'package:args/args.dart';
import 'package:arch_gen/commands/init.dart';
import 'package:arch_gen/commands/feature.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Usage: arch_gen <command>");
    return;
  }

  final command = arguments[0];

  switch (command) {
    // case 'init':
    //   initCommand();
    //   break;

    case 'feature':
      if (arguments.length < 2) {
        print("Provide feature name");
        return;
      }

      final featureName = arguments[1];

      final parser = ArgParser()
        ..addFlag('bloc', negatable: false)
        ..addFlag('riverpod', negatable: false)
        ..addFlag('equatable', defaultsTo: null);

      final results = parser.parse(arguments.skip(2));

      featureCommand(featureName, results);
      break;

    default:
      print("Unknown command");
  }
}
