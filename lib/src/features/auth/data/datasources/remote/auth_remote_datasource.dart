import 'package:dio/dio.dart';
import 'package:point_of_sale/src/features/auth/data/model/login_request_model.dart';
import 'package:point_of_sale/src/features/auth/data/model/login_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_datasource.g.dart';

@RestApi()
abstract interface class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST('/login')
  Future<HttpResponse<LoginResponseModel>> login(
    @Body() LoginRequestModel loginRequestModel,
  );
}
