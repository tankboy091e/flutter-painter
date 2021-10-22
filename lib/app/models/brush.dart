import 'package:flutter/material.dart';

class BrushModel {
  final Color color;
  final BlendMode blendMode;
  final StrokeCap strokeCap;
  final double strokeWidth;

  const BrushModel({
    required this.color,
    required this.blendMode,
    required this.strokeCap,
    required this.strokeWidth,
  });
}
