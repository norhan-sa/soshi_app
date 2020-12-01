import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soshi_app/features/home/home_provider.dart';

import '../../di.dart';
import '../../home.dart';
import 'routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            child: Home(),
            value: sl<HomeProvider>(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
