import 'package:flutter/material.dart';

import '../screens/pages/feed_page.dart';
import '../screens/pages/home_screen.dart';
import '../screens/pages/todo_page.dart';
import '../widgets/auth_check.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/todos/list': (_) => const ToDoPage(),
    '/feed': (_) => const FeedPage(),
    '/auth-check': (_) => const AuthCheck(),
    '/home_screen': (_) => const HomeScreen(),
  };

  static String initial = '/home_screen';

  static String authCheck = '/auth-check';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState to = Routes.navigatorKey!.currentState!;
}
