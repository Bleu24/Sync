// Example repository implementation
import '../domain/entities.dart';
import '../domain/repositories.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  @override
  Future<List<ExampleEntity>> getExamples() async {
    // TODO: implement data source
    return [];
  }
}
