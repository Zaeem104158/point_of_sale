import 'package:flutter/material.dart';

class UnderlinedNavigationDestinationWidget extends StatelessWidget {
  final Widget icon;
  final Widget selectedIcon;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  const UnderlinedNavigationDestinationWidget({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.selectedColor,
    required this.selectedIcon,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      label: '',
      icon: Column(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected ? selectedIcon : icon,

          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: isSelected ? 20 : 0,
            decoration: BoxDecoration(
              color: isSelected ? selectedColor : unselectedColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
