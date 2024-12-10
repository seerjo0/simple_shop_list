import 'package:go_router/go_router.dart';
import '../routing/routes.dart';
import '../ui/home/widgets/home_screen.dart';
import '../ui/settings/settings_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: Routes.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
