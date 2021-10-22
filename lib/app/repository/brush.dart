import 'package:drawing_tool/app/models/brush.dart';
import 'package:flutter/material.dart';

class BrushRepository {
  List<BrushModel> findAll() {
    return [
      const BrushModel(
        color: Colors.black,
        blendMode: BlendMode.srcOver,
        strokeCap: StrokeCap.round,
        strokeWidth: 2.0,
      ),
      const BrushModel(
        color: Colors.red,
        blendMode: BlendMode.srcOver,
        strokeCap: StrokeCap.round,
        strokeWidth: 2.0,
      ),
      const BrushModel(
        color: Colors.green,
        blendMode: BlendMode.srcOver,
        strokeCap: StrokeCap.round,
        strokeWidth: 2.0,
      ),
      const BrushModel(
        color: Colors.blue,
        blendMode: BlendMode.srcOver,
        strokeCap: StrokeCap.round,
        strokeWidth: 2.0,
      ),
      const BrushModel(
        color: Colors.black,
        blendMode: BlendMode.clear,
        strokeCap: StrokeCap.round,
        strokeWidth: 2.0,
      ),
    ];
  }
}
