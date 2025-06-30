import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/notification/data/datasources/remote/notification_remote_datasource.dart';
import 'package:point_of_sale/src/features/notification/data/model/read_notification_request_model.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/notification_response_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_request_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_response_entity.dart';
import 'package:point_of_sale/src/features/notification/domain/repository/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;
  NotificationRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<NotificationResponseEntity>>> getNotifications(
    int pComId,
    String pUsername,
  ) async {
    try {
      final httpResponse = await remoteDataSource.getNotifications(
        pComId,
        pUsername,
      );
      if (httpResponse.response.statusCode == 200 &&
          httpResponse.data.items.isNotEmpty) {
        final List<NotificationResponseEntity> notificationResponseEntity = [];
        for (int i = 0; i < httpResponse.data.items.length; i++) {
          notificationResponseEntity.add(httpResponse.data.items[i].toEntity());
        }

        return Right(notificationResponseEntity);
      } else {
        return Left(ServerFailure("Server Failure"));
      }
    } on DioException catch (e) {
      Logger().e("message: $e");
      return Left(ServerFailure(e.response?.data));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReadNotificationResponseEntity>> readNotifications(
    ReadNotificationRequestEntity readNotificationRequestEntity,
  ) async {
    try {
      ReadNotificationRequestModel readNotificationRequestModel =
          ReadNotificationRequestModel.fromEntity(
            readNotificationRequestEntity,
          );

      final httpResponse = await remoteDataSource.readNotification(
        readNotificationRequestModel,
      );

      if (httpResponse.response.statusCode == 200) {
        return Right(httpResponse.data);
      } else {
        getIt<Logger>().i("${readNotificationRequestModel.toJson()}");
        return Left(ServerFailure("Server Failure"));
      }
    } on DioException catch (e) {
      Logger().e("message: $e");
      return Left(ServerFailure(e.response?.data));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
