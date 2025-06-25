import 'package:point_of_sale/src/features/auth/domain/entity/login_request_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  LoginRequestModel({required super.username, required super.password});

  Map<String, dynamic> toJson() => {
    "P_USERNAME": username,
    "P_PASSWORD": password,
  };

  factory LoginRequestModel.fromEntity(LoginRequestEntity entity) {
    return LoginRequestModel(
      username: entity.username,
      password: entity.password,
    );
  }
}
