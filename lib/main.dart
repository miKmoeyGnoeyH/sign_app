import 'package:flutter/material.dart';
import 'package:sign_app/global/widgets/navigator_key_manager.dart';
import 'package:sign_app/pages/home/home_page.dart';
import 'package:sign_app/pages/signing/signing_page.dart';

import 'global/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: NavigatorKeyManager().navigatorKey,
      routes: routes,
      initialRoute: Routes.home.route,
      // home: const HomePage(),
    );
  }
}
