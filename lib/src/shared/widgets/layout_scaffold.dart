import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:point_of_sale/src/core/di/injection.dart';
import 'package:point_of_sale/src/core/service/database_service.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_response_entity.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_bloc.dart';
import 'package:point_of_sale/src/features/notification/presentation/bloc/notifications_event.dart';
import 'package:point_of_sale/src/shared/widgets/destinations_bottombar.dart';

class LayoutScaffold extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const LayoutScaffold({Key? key, required this.navigationShell})
    : super(key: key);

  @override
  State<LayoutScaffold> createState() => _LayoutScaffoldState();
}

class _LayoutScaffoldState extends State<LayoutScaffold> {
  int _lastIndex = 0;

  void _handleTabChange(int index) {
    final isSameTab = _lastIndex == index;
    _lastIndex = index;

    widget.navigationShell.goBranch(index);

    // 🔁 Trigger API logic when tab is (re)selected
    if (index == 2) {
      // Profile tab
      _callProfileApi();
    } else if (index == 1) {
      _callHomeApi();
    } else if (index == 0) {
      _callNotificationApi();
    }
  }

  void _callProfileApi() {
    debugPrint("🔁 Profile API called from tab switch");
  }

  void _callHomeApi() {
    debugPrint("🔁 Home API called from tab switch");
  }

  void _callNotificationApi() {
    debugPrint("🔁 Notification API called from tab switch");
    // if you need to call again apis:
    final store = getIt<ObjectBoxService>().store;
    final loginResponseBox = store.box<LoginResponseEntity>();
    final loginResponseData = loginResponseBox.getAll();
    final _bloc = context.read<NotificationBloc>();

    _bloc.add(LoadNotifications(loginResponseData.first));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: widget.navigationShell,
        ),
        value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      bottomNavigationBar: NavigationBar(
        animationDuration: Duration(milliseconds: 200),
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: _handleTabChange,

        destinations: getDestinations(context)
            .map(
              (dest) => NavigationDestination(
                icon: dest.icon,
                selectedIcon: dest.selectedIcon,
                label: dest.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
