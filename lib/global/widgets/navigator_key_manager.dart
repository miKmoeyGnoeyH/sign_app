import 'dart:developer';

import 'package:flutter/material.dart';

import '../routes/routes.dart';

class NavigatorKeyManager {
  static final NavigatorKeyManager _instance = NavigatorKeyManager._internal();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  void pushSigningPage() {
    log(_navigatorKey.currentState.toString());
    _navigatorKey.currentState!.pushNamed(Routes.signing.route);
  }

  void popUntilFirst() {
    log(_navigatorKey.currentState.toString());
    _navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  NavigatorKeyManager._internal(){
    log("NavigatorKeyManager created.");
  }

  factory NavigatorKeyManager() {
    return _instance;
  }
}