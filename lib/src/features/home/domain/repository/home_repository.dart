import 'package:fpdart/fpdart.dart';
import 'package:point_of_sale/src/core/error/failuer.dart';
import 'package:point_of_sale/src/features/home/domain/entity/home_response_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<HomeMenusResponseEntity>>> getHomeMenus(
    int pComId,
    String pUsername,
  );
}
