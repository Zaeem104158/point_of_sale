import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({
    super.result,
    super.message,
    super.username,
    super.mainCompanyId,
    super.comId,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      result: json['Result'] as String?,
      message: json['Message'] as String?,
      username: json['User'] as String?,
      mainCompanyId: json['MainCompany'] as int?,
      comId: json['ComId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Result': result,
      'Message': message,
      'User': username,
      'MainCompany': mainCompanyId,
      'ComId': comId,
    };
  }
}
