import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/home/domain/entity/company_news_report_entity.dart';
import 'package:point_of_sale/src/features/home/domain/repository/home_repository.dart';
import 'package:point_of_sale/src/shared/usecase/usecase.dart';

@LazySingleton()
class GetCompanyNews
    implements UseCase<List<CompanyNewsReportEntity>, LoginResponseEntity> {
  final HomeRepository _repository;

  GetCompanyNews(this._repository);

  @override
  Future<Result<List<CompanyNewsReportEntity>>> call(
    LoginResponseEntity loginResponseEntity,
  ) {
    return _repository.getCompanyNewsReport(loginResponseEntity.comId!);
  }
}
