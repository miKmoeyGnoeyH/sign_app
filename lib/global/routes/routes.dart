import 'package:flutter/material.dart';
import 'package:sign_app/pages/home/home_page.dart';
import 'package:sign_app/pages/signing/signing_page.dart';

enum Routes {
  home('/home', HomePage()),
  signing('/signing', SigningPage());

  const Routes(this.route, this.page);

  final String route;
  final Widget page;
}

final Map<String, WidgetBuilder> routes = {
  for (var route in Routes.values) route.route: (context) => route.page,
};