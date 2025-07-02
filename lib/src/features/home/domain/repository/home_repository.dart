import 'package:fpdart/fpdart.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/home/domain/entity/company_news_report_entity.dart';
import 'package:point_of_sale/src/features/home/domain/entity/home_response_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<HomeMenusResponseEntity>>> getHomeMenus(
    int pComId,
    String pUsername,
  );

  Future<Either<Failure, List<CompanyNewsReportEntity>>> getCompanyNewsReport(
    int pComId,
  );
}
