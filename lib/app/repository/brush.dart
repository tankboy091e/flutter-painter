import 'package:drawing_tool/app/models/brush.dart';
import 'package:flutter/material.dart';

class BrushRepository {
  static final BrushRepository _instance = BrushRepository._();
  factory BrushRepository() => _instance;
  BrushRepository._();

  List<BrushModel> findAll() {
    return [
      const BrushModel(
        brushType: BrushType.pencil,
        color: Colors.black,
        blendMode: BlendMode.srcOver,
        strokeCap: StrokeCap.round,
        strokeWidth: 1.5,
      ),
      const BrushModel(
        brushType: BrushType.brush,
        color: Colors.red,
        blendMode: BlendMode.srcOver,
        strokeCap: StrokeCap.round,
        strokeWidth: 24.0,
      ),
      const BrushModel(
        brushType: BrushType.brush,
        color: Colors.green,
        blendMode: BlendMode.srcOver,
        strokeCap: StrokeCap.round,
        strokeWidth: 24.0,
      ),
      const BrushModel(
        brushType: BrushType.brush,
        color: Colors.blue,
        blendMode: BlendMode.srcOver,
        strokeCap: StrokeCap.round,
        strokeWidth: 24.0,
      ),
      const BrushModel(
        brushType: BrushType.eraser,
        color: Colors.black,
        blendMode: BlendMode.clear,
        strokeCap: StrokeCap.round,
        strokeWidth: 24.0,
      ),
    ];
  }
}
