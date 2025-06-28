import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/route/app_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _fetchProfileData(); // initial load
  }

  Future<void> _fetchProfileData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    log("✅ Profile API called");
  }

  Future<void> _navigateToSettings() async {
    // Wait for result from Settings
    final result = await context.pushNamed(Routes.settings.name);
    log("Result $result");
    if (result == true) {
      log("🔁 Coming back from Settings → Refresh Profile");
      await _fetchProfileData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Profile"),
          ElevatedButton(
            onPressed: () {
              //  context.pushNamed(Routes.settings.name);
              _navigateToSettings();
            },
            child: Center(child: Text("Goto Settings")),
          ),
        ],
      ),
    );
  }
}
