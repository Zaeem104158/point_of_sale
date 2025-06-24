import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/route/app_page.dart';
import 'package:point_of_sale/src/core/service/asset_service.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';
import 'package:point_of_sale/src/shared/widgets/underlined_navigation_destination_widget.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  late int _selectedIndex;
  late Map<String, dynamic>? params;

  @override
  void initState() {
    _selectedIndex = _getInitialIndex();
    super.initState();
  }

  int _getInitialIndex() {
    final String currentPath = getIt<GoRouter>().state.uri.path;
    params = getIt<GoRouter>().state.extra as Map<String, dynamic>?;

    if (currentPath == Routes.notifications.path) return 0;
    if (currentPath == Routes.home.path) return 1;
    if (currentPath == Routes.profile.path) return 2;
    return 1; // Default to HOME
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          getIt<GoRouter>().goNamed(Routes.notifications.name);
          break;
        case 1:
          getIt<GoRouter>().goNamed(Routes.home.name);

          break;
        case 2:
          getIt<GoRouter>().goNamed(Routes.profile.name);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return NavigationBar(
      height: kBottomNavigationBarHeight,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: isDarkMode
          ? AppColor.lightText
          : AppColor.primary.withValues(alpha: 0.15),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onItemTapped,
      destinations: [
        // notificaion
        UnderlinedNavigationDestinationWidget(
          icon: Image.asset(
            AssetsService.notificationLight,
            height: 20.sp,
            width: 20.sp,
          ),
          selectedIcon: Image.asset(
            AssetsService.notificationDark,
            height: 20.sp,
            width: 20.sp,
          ),
          selectedColor: isDarkMode ? AppColor.lightText : AppColor.darkText,
          unselectedColor: AppColor.cardDark,
          isSelected: _selectedIndex == 0,
        ),

        // Home
        UnderlinedNavigationDestinationWidget(
          icon: Image.asset(
            AssetsService.homeLight,
            height: 20.sp,
            width: 20.sp,
          ),
          selectedIcon: Image.asset(
            AssetsService.homeDark,
            height: 20.sp,
            width: 20.sp,
          ),
          selectedColor: isDarkMode ? AppColor.lightText : AppColor.darkText,
          unselectedColor: AppColor.cardDark,
          isSelected: _selectedIndex == 1,
        ),

        // Profile
        UnderlinedNavigationDestinationWidget(
          icon: Image.asset(
            AssetsService.profileLight,
            height: 20.sp,
            width: 20.sp,
          ),
          selectedIcon: Image.asset(
            AssetsService.profileDark,
            height: 20.sp,
            width: 20.sp,
          ),
          selectedColor: isDarkMode ? AppColor.lightText : AppColor.darkText,
          unselectedColor: AppColor.cardDark,
          isSelected: _selectedIndex == 2,
        ),
      ],
    );
  }
}
