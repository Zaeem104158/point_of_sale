import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_request_entity.dart';

class ReadNotificationRequestModel extends ReadNotificationRequestEntity {
  ReadNotificationRequestModel({super.pComId, super.pNotificationId});
  Map<String, dynamic> toJson() => {
    "P_COM_ID": pComId,
    "P_NOT_ID": pNotificationId,
  };

  factory ReadNotificationRequestModel.fromEntity(
    ReadNotificationRequestEntity entity,
  ) {
    return ReadNotificationRequestModel(
      pComId: entity.pComId,
      pNotificationId: entity.pNotificationId,
    );
  }
}
