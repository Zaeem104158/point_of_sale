import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/home/data/datasources/remote/home_remote_datasource.dart';
import 'package:point_of_sale/src/features/home/domain/entity/home_response_entity.dart';
import 'package:point_of_sale/src/features/home/domain/repository/home_repository.dart';
import 'package:point_of_sale/src/core/di/injection.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource remoteDatasource;
  HomeRepositoryImpl(this.remoteDatasource);
  @override
  Future<Either<Failure, List<HomeMenusResponseEntity>>> getHomeMenus(
    int pComId,
    String pUsername,
  ) async {
    try {
      final httpResponse = await remoteDatasource.getHomeMenus(
        pComId,
        pUsername,
      );
      if (httpResponse.response.statusCode == 200 &&
          httpResponse.data.items.isNotEmpty) {
        final List<HomeMenusResponseEntity> homeMenusList = [];
        for (int i = 0; i < httpResponse.data.items.length; i++) {
          homeMenusList.add(httpResponse.data.items[i].toEntity());
        }

        return Right(homeMenusList);
      } else {
        return Left(ServerFailure("Server Failure"));
      }
    } on DioException catch (e) {
      getIt<Logger>().e("message: $e");
      return Left(ServerFailure(e.response?.data));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
