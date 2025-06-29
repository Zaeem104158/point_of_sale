import 'package:objectbox/objectbox.dart';

@Entity()
class NotificationResponseEntity {
  @Id()
  int id = 0;

  int? asnNotId;
  String? asnNotLabel;
  String? asnNotDesc;
  int? asnNotStatus;
  int? asnNotAscCompId;
  DateTime? asnNotCreatedDate;
  String? asnNotCreatedBy;

  NotificationResponseEntity({
    required this.asnNotId,
    required this.asnNotLabel,
    required this.asnNotDesc,
    required this.asnNotStatus,
    required this.asnNotAscCompId,
    required this.asnNotCreatedDate,
    required this.asnNotCreatedBy,
  });
}
