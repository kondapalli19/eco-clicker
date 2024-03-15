import 'package:go_router/go_router.dart';

import 'presentation/layout.dart';
import 'presentation/clicker/clicker_screen.dart';
import 'presentation/shop/shop_screen.dart';
import 'presentation/stats/stats_screen.dart';
import 'presentation/settings/settings_screen.dart';
import 'presentation/debug/debug_screen.dart';

/// Router configuration
final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Layout(child: child);
      },
      routes: [
        GoRoute(
          name: "home",
          path: "/",
          builder: (context, state) => const ClickerScreen(),
        ),
        GoRoute(
          name: "shop",
          path: "/shop",
          builder: (context, state) => const ShopScreen(),
        ),
        GoRoute(
          name: "stats",
          path: "/stats",
          builder: (context, state) => const StatsScreen(),
        ),
        GoRoute(
          name: "settings",
          path: "/settings",
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          name: "debug",
          path: "/debug",
          builder: (context, state) => const DebugScreen(),
        ),
      ],
    )
  ],
);
