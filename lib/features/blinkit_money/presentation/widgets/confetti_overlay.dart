import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flicktv_bhuvaneshwaran/core/theme/app_colors.dart';

enum ConfettiSide { left, right }

class ConfettiParticle {
  ConfettiParticle({
    required this.side,
    required this.vx,
    required this.vy,
    required this.color,
    required this.width,
    required this.height,
    required this.angle,
    required this.angularVelocity,
  });

  ConfettiSide side;
  double vx;
  double vy;
  Color color;
  double width;
  double height;
  double angle;
  double angularVelocity;
}

/// A custom painter based overlay that sprays confetti from the sides of the screen.
class ConfettiOverlay extends StatefulWidget {
  const ConfettiOverlay({super.key, required this.animation});
  final Animation<double> animation;

  @override
  State<ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay> {
  final List<ConfettiParticle> _particles = [];

  @override
  void initState() {
    super.initState();
    _generateParticles();
  }

  void _generateParticles() {
    final rand = Random();
    final colors = [
      AppColors.primaryGreen,
      AppColors.blinkitYellow,
      AppColors.iconYellow,
      Colors.blue,
      Colors.pinkAccent,
    ];
    
    // Spray from left side (x = 0)
    for (int i = 0; i < 20; i++) {
      final speed = 400 + rand.nextDouble() * 600;
      // Angle clustered tightly around 45 degrees (40 to 50 degrees)
      final angle = (40 + rand.nextDouble() * 10) * pi / 180;

      _particles.add(ConfettiParticle(
        side: ConfettiSide.left,
        vx: speed * cos(angle),
        vy: -speed * sin(angle),
        color: colors[rand.nextInt(colors.length)],
        width: 6 + rand.nextDouble() * 8,
        height: 12 + rand.nextDouble() * 12,
        angle: rand.nextDouble() * pi,
        angularVelocity: (rand.nextDouble() - 0.5) * 15,
      ));
    }

    // Spray from right side (x = width)
    for (int i = 0; i < 20; i++) {
      final speed = 400 + rand.nextDouble() * 600;
      // Angle clustered tightly around 45 degrees (40 to 50 degrees)
      final angle = (40 + rand.nextDouble() * 10) * pi / 180;

      _particles.add(ConfettiParticle(
        side: ConfettiSide.right,
        vx: -speed * cos(angle),
        vy: -speed * sin(angle),
        color: colors[rand.nextInt(colors.length)],
        width: 6 + rand.nextDouble() * 8,
        height: 12 + rand.nextDouble() * 12,
        angle: rand.nextDouble() * pi,
        angularVelocity: (rand.nextDouble() - 0.5) * 15,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, _) {
        if (widget.animation.value == 0.0 || widget.animation.value == 1.0) {
          return const SizedBox.shrink();
        }
        return CustomPaint(
          painter: _ConfettiPainter(
            progress: widget.animation.value,
            particles: _particles,
          ),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter({
    required this.progress,
    required this.particles,
  });

  final double progress;
  final List<ConfettiParticle> particles;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;

    final paint = Paint();
    // Lowered the starting height slightly below the wallet icon
    final centerY = size.height * 0.45;

    for (final p in particles) {
      final startX = p.side == ConfettiSide.left ? 0.0 : size.width;

      final currentX = startX + (p.vx * progress);
      // Gravity pulls vy down exponentially over time
      final gravity = 800.0 * progress * progress;
      final currentY = centerY + (p.vy * progress) + gravity;
      
      final opacity = (1.0 - progress).clamp(0.0, 1.0);
      if (opacity <= 0.0) continue;
      
      paint.color = p.color.withValues(alpha: opacity);
      
      canvas.save();
      canvas.translate(currentX, currentY);
      canvas.rotate(p.angle + (p.angularVelocity * progress));
      
      canvas.drawRect(
        Rect.fromCenter(center: Offset.zero, width: p.width, height: p.height), 
        paint,
      );
      
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
