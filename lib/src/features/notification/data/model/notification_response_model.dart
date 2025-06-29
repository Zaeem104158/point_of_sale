import 'package:point_of_sale/src/features/notification/domain/entity/notification_response_entity.dart';

class NotificationResponseModel extends NotificationResponseEntity {


  NotificationResponseModel({
    super.asnNotId,
    super.asnNotLabel,
    super.asnNotDesc,
    super.asnNotStatus,
    super.asnNotAscCompId,
    super.asnNotCreatedDate,
    super.asnNotCreatedBy,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      asnNotId: json['asn_not_id'],
      asnNotLabel: json['asn_not_label'],
      asnNotDesc: json['asn_not_desc'],
      asnNotStatus: json['asn_not_status'],
      asnNotAscCompId: json['asn_not_asc_comp_id'],
      asnNotCreatedDate: DateTime.parse(json['asn_not_created_date']).toLocal(),
      asnNotCreatedBy: json['asn_not_created_by'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asn_not_id': asnNotId,
      'asn_not_label': asnNotLabel,
      'asn_not_desc': asnNotDesc,
      'asn_not_status': asnNotStatus,
      'asn_not_asc_comp_id': asnNotAscCompId,
      'asn_not_created_date': asnNotCreatedDate?.toIso8601String(),
      'asn_not_created_by': asnNotCreatedBy,
    };
  }

  factory NotificationResponseModel.fromEntity(NotificationResponseModel entity) {
    return NotificationResponseModel(
      asnNotId: entity.asnNotId,
      asnNotLabel: entity.asnNotLabel,
      asnNotDesc: entity.asnNotDesc,
      asnNotStatus: entity.asnNotStatus,
      asnNotAscCompId: entity.asnNotAscCompId,
      asnNotCreatedDate: entity.asnNotCreatedDate,
      asnNotCreatedBy: entity.asnNotCreatedBy,
    );
  }

  NotificationResponseModel toEntity() {
    return NotificationResponseModel(
      asnNotId: asnNotId,
      asnNotLabel: asnNotLabel,
      asnNotDesc: asnNotDesc,
      asnNotStatus: asnNotStatus,
      asnNotAscCompId: asnNotAscCompId,
      asnNotCreatedDate: asnNotCreatedDate,
      asnNotCreatedBy: asnNotCreatedBy,
    );
  }
}
