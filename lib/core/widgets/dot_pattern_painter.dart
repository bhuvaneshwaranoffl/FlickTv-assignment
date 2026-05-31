import 'package:flutter/material.dart';

class DotPatternPainter extends CustomPainter {
  const DotPatternPainter({
    this.color = Colors.white,
    this.dotRadius = 2.0,
    this.spacing = 16.0,
  });

  final Color color;
  final double dotRadius;
  final double spacing;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    
    final rows = (size.height / spacing).ceil();
    final cols = (size.width / spacing).ceil();

    // The pattern fades out as it goes down. Decreased height to fade completely by 35% of the screen height.
    final fadeRows = rows * 0.35;

    for (int row = 0; row < rows; row++) {
      if (row > fadeRows) break;
      
      // Calculate opacity: highest at top (row 0), 0 at fadeRows
      final progress = row / fadeRows; 
      final opacity = (1.0 - progress) * 0.15; // Max opacity 15% at the very top
      
      paint.color = color.withValues(alpha: opacity);
      
      final y = row * spacing;
      for (int col = 0; col < cols; col++) {
        final x = col * spacing;
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DotPatternPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dotRadius != dotRadius ||
        oldDelegate.spacing != spacing;
  }
}
