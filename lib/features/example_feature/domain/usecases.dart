import 'entities.dart';
import 'repositories.dart';
import '../../../core/usecase.dart';

class GetExamples extends UseCase<List<ExampleEntity>, void> {
  final ExampleRepository repository;
  GetExamples(this.repository);

  @override
  Future<List<ExampleEntity>> call(void params) {
    return repository.getExamples();
  }
}
