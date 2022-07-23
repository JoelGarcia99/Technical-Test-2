import 'package:flutter/material.dart';
import 'package:technical_test/config/custom_theme.dart';
import 'package:technical_test/router/enum.routes.dart';

/// A custom bottom navigation bar with the logic for route
/// changing already implemented
class CustomBottomMenu extends StatelessWidget {
  /// Current tab index the user is on
  late final int _defaultTab;

  /// List of tabs to show according to the bottom menu
  final tabList = <RouteNames>[
    RouteNames.home,
    RouteNames.notFound,
    RouteNames.revenue,
    RouteNames.notFound
  ];

  CustomBottomMenu({Key? key, required RouteNames route}) : super(key: key) {
    // searching the index of the user route
    _defaultTab = tabList.indexOf(route);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppTheme.getTheme().backgroundColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.withOpacity(0.5),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _defaultTab,
      onTap: (tabIndex) {
        // redirecting the user to the new screen
        Navigator.of(context).pushNamed(tabList[tabIndex].path);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: 'location'),
        BottomNavigationBarItem(
            icon: Icon(Icons.signal_cellular_alt), label: "Revenue"),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month), label: "calendar")
      ],
    );
  }
}
