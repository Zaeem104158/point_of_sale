import 'package:point_of_sale/src/features/notification/domain/entity/read_notification_response_entity.dart';

class ReadNotificationResponseModel extends ReadNotificationResponseEntity {
  ReadNotificationResponseModel({super.result, super.message});

  factory ReadNotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return ReadNotificationResponseModel(
      result: json['Result'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Result': result, 'Message': message};
  }
}
