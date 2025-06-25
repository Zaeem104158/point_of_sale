import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({super.result, super.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      result: json['Result'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Result': result, 'Message': message};
  }
}
