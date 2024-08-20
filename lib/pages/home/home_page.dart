import 'package:flutter/material.dart';
import 'package:sign_app/global/widgets/appbar.dart';
import 'package:sign_app/pages/home/widgets/hp_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const CustomAppBar("Home"),
            HomePageBody(),
          ],
        ),
      ),
    );
  }
}
