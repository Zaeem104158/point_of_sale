import 'package:point_of_sale/src/features/home/domain/entity/company_news_report_entity.dart';
import 'package:point_of_sale/src/features/home/domain/entity/home_response_entity.dart';

class CompanyNewsReportModel extends CompanyNewsReportEntity {
  CompanyNewsReportModel({super.message});

  factory CompanyNewsReportModel.fromJson(Map<String, dynamic> json) =>
      CompanyNewsReportModel(message: json["message"]);

  Map<String, dynamic> toJson() => {"message": message};

  factory CompanyNewsReportModel.fromEntity(CompanyNewsReportEntity entity) {
    return CompanyNewsReportModel(message: entity.message);
  }

  CompanyNewsReportModel toEntity() {
    return CompanyNewsReportModel(message: message);
  }
}
