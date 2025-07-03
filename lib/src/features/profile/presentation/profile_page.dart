import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/service/cache_service.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';
import 'package:point_of_sale/src/shared/theme/theme_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    final currentTheme = getIt<ICacheService>().read(LocalCacheKeys.theme);
    isDarkMode = currentTheme == "dark"; // true if dark, false otherwise
  }

  // Future<void> _fetchProfileData() async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   log("✅ Profile API called");
  // }

  // Future<void> _navigateToSettings() async {
  //   // Wait for result from Settings
  //   final result = await context.pushNamed(Routes.settings.name);
  //   log("Result $result");
  //   if (result == true) {
  //     log("🔁 Coming back from Settings → Refresh Profile");
  //     await _fetchProfileData();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      darkTheme: SettingsThemeData(
        settingsListBackground: AppColor.darkBackground,
      ),
      lightTheme: SettingsThemeData(
        settingsListBackground: AppColor.lightBackground,
        settingsSectionBackground: Colors.grey.withValues(alpha: 0.1),
      ),
      sections: [
        SettingsSection(
          title: Text('Section'),
          tiles: [
            SettingsTile(
              title: Text('Language'),
              description: Text('English'),
              leading: Icon(Icons.language),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile.switchTile(
              initialValue: isDarkMode,
              title: Text('Dark Mode'),
              leading: Icon(Icons.brightness_6),
              onToggle: (bool value) {
                final themeCubit = getIt<ThemeCubit>();
                final newMode = value ? ThemeMode.dark : ThemeMode.light;
                themeCubit.setTheme(newMode);
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
