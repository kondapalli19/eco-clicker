import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navbar_item.dart';
import '/theme.dart';

// Navigates to a route given context
void goToRoute(String routeName, BuildContext context) {
  context.goNamed(routeName);
}

class Navbar extends StatefulWidget {
  // Returns a horizontal navbar
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String _activeRoute = 'home'; // Initially set to 'home'

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EcoColors.bgLight.withOpacity(0.8), // Set background color with opacity
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NavbarItem(
          iconPath: 'assets/home.png',
          onTap: () => _updateActiveRoute('home'),
          isActive: _activeRoute == 'home',
        ),
        NavbarItem(
          iconPath: 'assets/shop.png',
          onTap: () => _updateActiveRoute('shop'),
          isActive: _activeRoute == 'shop',
        ),
        NavbarItem(
          iconPath: 'assets/stats.png',
          onTap: () => _updateActiveRoute('stats'),
          isActive: _activeRoute == 'stats',
        ),
        NavbarItem(
          iconPath: 'assets/settings.png',
          onTap: () => _updateActiveRoute('settings'),
          isActive: _activeRoute == 'settings',
        ),
      ],
    )
    );
  }

  void _updateActiveRoute(String routeName) {
    setState(() {
      _activeRoute = routeName;
    });
    goToRoute(routeName, context);
  }
}
