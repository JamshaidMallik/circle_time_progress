library gradient_circular_progress;

import 'dart:math';
import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final double strokeWidth;
  final Gradient gradient;
  final Color backgroundColor;
  final double size;
  final double startAngle;
  final StrokeCap strokeCap;

  const GradientCircularProgressIndicator({
    Key? key,
    required this.value,
    this.strokeWidth = 10,
    required this.gradient,
    this.backgroundColor = Colors.grey,
    this.size = 100,
    this.startAngle = -pi / 2, // default to top
    this.strokeCap = StrokeCap.round,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GradientCircularProgressPainter(
          value: value.clamp(0.0, 1.0),
          strokeWidth: strokeWidth,
          gradient: gradient,
          backgroundColor: backgroundColor,
          startAngle: startAngle,
          strokeCap: strokeCap,
        ),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double value;
  final double strokeWidth;
  final Gradient gradient;
  final Color backgroundColor;
  final double startAngle;
  final StrokeCap strokeCap;

  _GradientCircularProgressPainter({
    required this.value,
    required this.strokeWidth,
    required this.gradient,
    required this.backgroundColor,
    required this.startAngle,
    required this.strokeCap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.width - strokeWidth) / 2;

    // Draw background circle
    final bgPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, bgPaint);

    // Draw progress arc
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = strokeCap;

    final sweep = 2 * pi * value;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweep,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
