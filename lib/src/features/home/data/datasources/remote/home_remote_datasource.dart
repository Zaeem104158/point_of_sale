import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/features/home/data/model/company_news_report_model.dart';
import 'package:point_of_sale/src/features/home/data/model/home_response_model.dart';
import 'package:point_of_sale/src/shared/model/pagination_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_remote_datasource.g.dart';

@LazySingleton()
@RestApi()
abstract interface class HomeRemoteDatasource {
  @factoryMethod
  factory HomeRemoteDatasource(Dio dio) = _HomeRemoteDatasource;

  @GET('/POS_MENU_ACCESS_MOBILE')
  Future<HttpResponse<PaginationModel<HomeResponseModel>>> getHomeMenus(
    @Query('P_COM_ID') int pComIn,
    @Query('P_USERNAME') String pUsername,
  );
  @GET('/POS_COMPANY_NEWS_REPORT')
  Future<HttpResponse<PaginationModel<CompanyNewsReportModel>>> getCompanyNewsReport(
    @Query('P_COM_ID') int pComIn,
  );
  // @POST('/POS_NOTIFICATION')
  // Future<HttpResponse<ReadNotificationResponseModel>> readNotification(
  //   @Body() ReadNotificationRequestModel pComIn,
  // );
}
