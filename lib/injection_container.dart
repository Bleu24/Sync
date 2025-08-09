// Dependency injection setup
import 'features/example_feature/data/repositories_impl.dart';
import 'features/example_feature/domain/repositories.dart';

class InjectionContainer {
  static ExampleRepository provideExampleRepository() {
    return ExampleRepositoryImpl();
  }
}
