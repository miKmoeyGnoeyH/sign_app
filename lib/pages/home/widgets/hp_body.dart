import 'package:flutter/material.dart';

import '../../../global/widgets/navigator_key_manager.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});
  final NavigatorKeyManager navigatorKeyManager = NavigatorKeyManager();

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Container(
        color: Colors.white,
        child: Center(
          child: GestureDetector(
            onTap: () => navigatorKeyManager.pushSigningPage(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Sign",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
