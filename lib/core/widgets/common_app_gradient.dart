import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/theme/app_colors.dart';

import 'package:flicktv_bhuvaneshwaran/core/widgets/dot_pattern_painter.dart';

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
            AppColors.background,
          ],
          stops: [0.0, 0.4, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: const DotPatternPainter(
                color: Colors.white,
                dotRadius: 2.0,
                spacing: 16.0,
              ),
            ),
          ),
          Positioned.fill(
            child: child,
          ),
        ],
      ),
    );
  }
}
