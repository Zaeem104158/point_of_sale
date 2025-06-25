import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/auth/data/model/login_request_model.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_request_entity.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';

import '../../domain/repository/auth_repository.dart';
import '../datasources/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
    LoginRequestEntity loginRequestEntity,
  ) async {
    try {
      LoginRequestModel loginRequestModel = LoginRequestModel.fromEntity(
        loginRequestEntity,
      );

      final response = await remoteDataSource.login(loginRequestModel);
      log("Response is : ${response.data.result}}");
      if (response.response.statusCode == 200 &&
          response.data.result?.toLowerCase() == 'success') {
        return Right(response.data);
      } else {
        return Left(ServerFailure(response.data.message ?? "Server Failure"));
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['Message'] ?? e.message ?? 'Server error',
        ),
      );
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
