// Example data model
import '../domain/entities.dart';

class ExampleModel extends ExampleEntity {
  ExampleModel({required String id, required String name})
    : super(id: id, name: name);

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
