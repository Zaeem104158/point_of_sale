import 'package:flutter/material.dart';
import 'package:point_of_sale/src/core/service/asset_service.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';

class Destination {
  const Destination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
  final Widget icon;
  final Image selectedIcon;
  final String label;
}

List<Destination> getDestinations(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return [
    Destination(
      icon: Image.asset(
        AssetsService.notificationLight,
        height: 20,
        width: 20,
        color: isDark ? AppColor.lightBackground : null,
      ),
      selectedIcon: Image.asset(
        AssetsService.notificationDark,
        height: 20,
        width: 20,
      ),
      label: 'Notifications',
    ),
    Destination(
      icon: Center(
        child: Image.asset(
          AssetsService.homeLight,
          height: 20,
          width: 20,
          color: isDark ? AppColor.lightBackground : null,
        ),
      ),
      selectedIcon: Image.asset(AssetsService.homeDark, height: 20, width: 20),
      label: 'Home',
    ),
    Destination(
      icon: Image.asset(
        AssetsService.profileLight,
        height: 20,
        width: 20,
        color: isDark ? AppColor.lightBackground : null,
      ),
      selectedIcon: Image.asset(
        AssetsService.profileDark,
        height: 20,
        width: 20,
      ),
      label: 'Profile',
    ),
  ];
}
