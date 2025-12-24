import 'package:flutter/material.dart';

class MobileContainer extends StatelessWidget {
  final Widget child;
  final Widget? bottomNav;
  final bool removePadding;

  const MobileContainer({super.key, required this.child, this.bottomNav, this.removePadding = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            Expanded(child: child),
            if (bottomNav != null) bottomNav!,
          ],
        ),
      ),
    );
  }
}
