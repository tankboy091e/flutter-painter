import 'package:drawing_tool/app/models/line.dart';
import 'package:flutter/material.dart';

class Sketcher extends CustomPainter {
  final List<LineModel> lines;

  Sketcher({
    required this.lines,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final line in lines) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..color = line.brush.color
        ..blendMode = line.brush.blendMode
        ..strokeCap = line.brush.strokeCap
        ..strokeWidth = line.brush.strokeWidth;

      final path = Path();

      final firstTouch = line.paths.first;

      path.moveTo(firstTouch.dx, firstTouch.dy);

      for (final offset in line.paths.sublist(1)) {
        path.lineTo(offset.dx, offset.dy);
      }

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
