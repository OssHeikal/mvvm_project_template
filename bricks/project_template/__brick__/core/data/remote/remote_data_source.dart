import '../../resources/type_defs.dart';
import '../dio/dio_client.dart';

/// Add your remote data source methods here
///
/// [ParamsMap] is a type def for Map<String, String?>?
/// [BodyMap] is a type def for Map<String, dynamic>
///
/// Example:
/// Future<Response> login(BodyMap body);
/// Future<Response> getCities(ParamsMap);
abstract class RemoteDataSource {}

class RemoteDataSourceImpl implements RemoteDataSource {
  final DioClient dio;

  RemoteDataSourceImpl(this.dio);
}
