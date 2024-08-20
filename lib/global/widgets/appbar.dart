import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      elevation: 10,
      shadowColor: Colors.black.withOpacity(0.2),
      pinned: true,
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
      ),
    );
  }

  final String title;
}
