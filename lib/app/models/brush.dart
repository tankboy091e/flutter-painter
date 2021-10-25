import 'package:flutter/material.dart';

enum BrushType {
  pencil,
  brush,
  eraser,
}

class BrushModel {
  final BrushType brushType;
  final Color color;
  final BlendMode blendMode;
  final StrokeCap strokeCap;
  final double strokeWidth;

  const BrushModel({
    required this.brushType,
    required this.color,
    required this.blendMode,
    required this.strokeCap,
    required this.strokeWidth,
  });
}
