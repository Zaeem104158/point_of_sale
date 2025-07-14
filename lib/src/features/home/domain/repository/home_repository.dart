import 'package:point_of_sale/src/features/home/domain/entity/company_news_report_entity.dart';
import 'package:point_of_sale/src/features/home/domain/entity/home_response_entity.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

abstract interface class HomeRepository {
  Future<Result<List<HomeMenusResponseEntity>>> getHomeMenus(
    int pComId,
    String pUsername,
  );

  Future<Result<List<CompanyNewsReportEntity>>> getCompanyNewsReport(
    int pComId,
  );
}
