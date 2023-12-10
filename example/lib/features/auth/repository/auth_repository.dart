import '../../../core/data/remote/remote_data_source.dart';

abstract class AuthRepository {
  const AuthRepository();
}

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);
}