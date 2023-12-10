import '../../../core/data/remote/remote_data_source.dart';

abstract class {{featureName.pascalCase()}}Repository {
  const {{featureName.pascalCase()}}Repository();
}

class {{featureName.pascalCase()}}RepositoryImpl extends {{featureName.pascalCase()}}Repository {
  final RemoteDataSource remoteDataSource;
  const {{featureName.pascalCase()}}RepositoryImpl(this.remoteDataSource);
}