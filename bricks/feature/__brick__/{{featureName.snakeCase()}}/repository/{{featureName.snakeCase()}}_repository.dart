import '../../../core/data/error/error_handler.dart';
import '../../../core/data/remote/remote_data_source.dart';


abstract class {{featureName.pascalCase()}}Repository {
  const {{featureName.pascalCase()}}Repository();
}

/// use [wrapHandlingException] from [HandlingException] to handle any exceptions that may occur during authentication.
/// it takes two parameters:
/// 1- [function] : the function that may throw an exception.
/// 2- [jsonConvert] : the function that converts the json response to the required model.
class {{featureName.pascalCase()}}RepositoryImpl with HandlingException implements {{featureName.pascalCase()}}Repository {
  final RemoteDataSource remoteDataSource;
  const {{featureName.pascalCase()}}RepositoryImpl(this.remoteDataSource);
}