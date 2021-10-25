import 'package:drawing_tool/app/models/brush.dart';
import 'package:drawing_tool/app/models/line.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final List<LineModel> lines;
  final LineModel eraseLine;

  Painter({
    required this.lines,
    required this.eraseLine,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(Rect.fromLTWH(0.0, 0.0, size.width, size.height), Paint());

    for (final line in lines) {
      final paint = _getPaint(line.brush);
      final path = _getPath(line.paths);

      canvas.drawPath(path, paint);
    }
  }

  static Path _getPath(List<Offset> paths) {
    final path = Path();

    final firstTouch = paths.first;

    path.moveTo(firstTouch.dx, firstTouch.dy);

    for (final offset in paths.sublist(1)) {
      path.lineTo(offset.dx, offset.dy);
    }

    return path;
  }

  static Paint _getPaint(BrushModel brush) {
    return Paint()
      ..style = PaintingStyle.stroke
      ..color = brush.color
      ..blendMode = brush.blendMode
      ..strokeCap = brush.strokeCap
      ..strokeWidth = brush.strokeWidth;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
