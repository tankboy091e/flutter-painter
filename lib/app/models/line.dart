import 'package:drawing_tool/app/models/brush.dart';
import 'package:flutter/material.dart';

class LineModel {
  final BrushModel brush;
  final List<Offset> paths;

  const LineModel({
    required this.brush,
    required this.paths,
  });
}
