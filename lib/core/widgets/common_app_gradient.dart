import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CommonAppGradient extends StatelessWidget {
  const CommonAppGradient({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.headerBackground,
            AppColors.background,
          ],
          stops: [0.0, 0.4],
        ),
      ),
      child: child,
    );
  }
}
