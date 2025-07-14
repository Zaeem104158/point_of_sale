import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/auth/data/model/login_request_model.dart';
import 'package:point_of_sale/src/features/auth/data/model/login_response_model.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_request_entity.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';
import 'package:retrofit/dio.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasources/remote/auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<LoginResponseEntity>> login(
    LoginRequestEntity loginRequestEntity,
  ) async {
    try {
      LoginRequestModel loginRequestModel = LoginRequestModel.fromEntity(
        loginRequestEntity,
      );

      final HttpResponse<LoginResponseModel> httpResponse =
          await remoteDataSource.login(loginRequestModel);
      if (httpResponse.response.statusCode == 200 &&
          httpResponse.data.result?.toLowerCase() == 'success') {
        return Right(httpResponse.data);
      } else {
        return Left(
          ServerFailure(httpResponse.data.message ?? "Server Failure"),
        );
      }
    } on DioException catch (e) {
      Logger().e("message: $e");
      return Left(ServerFailure(e.response?.data));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
