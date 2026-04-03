import '../../domain/entities/{{snake}}_entity.dart';

class {{Feature}}Model extends {{Feature}}Entity {
  const {{Feature}}Model({
    required super.id,
    required super.name,
  });

  factory {{Feature}}Model.fromJson(Map<String, dynamic> json) {
    return {{Feature}}Model(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}