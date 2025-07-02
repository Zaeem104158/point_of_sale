import 'package:point_of_sale/src/features/home/domain/entity/home_response_entity.dart';

class HomeResponseModel extends HomeMenusResponseEntity {
  HomeResponseModel({super.aumMenuDesc, super.aumaAumMenuId, super.iconsImage});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        aumaAumMenuId: json["auma_aum_menu_id"],
        aumMenuDesc: json["aum_menu_desc"],
        iconsImage: json["icons_image"],
      );

  Map<String, dynamic> toJson() => {
    "auma_aum_menu_id": aumaAumMenuId,
    "aum_menu_desc": aumMenuDesc,
    "icons_image": iconsImage,
  };

  factory HomeResponseModel.fromEntity(HomeMenusResponseEntity entity) {
    return HomeResponseModel(
      aumaAumMenuId: entity.aumaAumMenuId,
      aumMenuDesc: entity.aumMenuDesc,
      iconsImage: entity.iconsImage,
    );
  }

  HomeResponseModel toEntity() {
    return HomeResponseModel(
      aumaAumMenuId: aumaAumMenuId,
      aumMenuDesc: aumMenuDesc,
      iconsImage: iconsImage,
    );
  }
}
