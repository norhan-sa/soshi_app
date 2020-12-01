import 'package:flutter/material.dart';

import 'di.dart';
import 'utils_and_services/routing/navigation_service.dart';
import 'utils_and_services/routing/router.dart' as router;
import 'utils_and_services/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(
    MaterialApp(
      navigatorKey: sl<NavigationService>().navigatorKey,
      initialRoute: home,
      onGenerateRoute: router.Router.generateRoute,
    ),
  );
}
