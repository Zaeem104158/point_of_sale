import 'package:objectbox/objectbox.dart';

@Entity()
class LoginResponseEntity {
  @Id(assignable: true)
  int id = 0;
  final String? result;
  final String? message;
  final String? username;
  final int? mainCompanyId;
  final int? comId;

  LoginResponseEntity({
    this.result,
    this.message,
    this.username,
    this.mainCompanyId,
    this.comId,
  });
}
