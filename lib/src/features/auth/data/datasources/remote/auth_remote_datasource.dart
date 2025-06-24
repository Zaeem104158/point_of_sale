import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_remote_datasource.g.dart';

@RestApi()
abstract interface class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST('/login')
  Future<HttpResponse<LoginModel>> login(
    @Body() LoginRequestModel loginRequestModel,
  );
}
