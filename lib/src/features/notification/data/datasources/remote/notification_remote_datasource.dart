import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/features/notification/data/model/notification_response_model.dart';
import 'package:point_of_sale/src/shared/model/pagination_model.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_remote_datasource.g.dart';

@LazySingleton()
@RestApi()
abstract interface class NotificationRemoteDataSource {
  @factoryMethod
  factory NotificationRemoteDataSource(Dio dio) = _NotificationRemoteDataSource;

  @GET('/POS_NOTIFICATION')
  Future<HttpResponse<PaginationModel<NotificationResponseModel>>> getNotifications(
    @Query('P_COM_ID') int pComIn,
    @Query('P_USERNAME') String pUsername,
  );
}
