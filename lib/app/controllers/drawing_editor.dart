import 'package:drawing_tool/app/interfaces/controller.dart';
import 'package:drawing_tool/app/models/brush.dart';
import 'package:drawing_tool/app/models/line.dart';
import 'package:drawing_tool/app/repository/brush.dart';
import 'package:flutter/cupertino.dart';

class DrawingEditorController extends Controller {
  final BrushRepository brushRepository;

  late BuildContext _context;

  late List<BrushModel> _brushs;

  late int _brushIndex;

  int get brushIndex => _brushIndex;

  BrushModel get _selectedBrush => _brushs[_brushIndex];

  late List<LineModel> _lines;

  List<LineModel> get lines => _lines;

  DrawingEditorController({
    required this.brushRepository,
  }) {
    _brushs = brushRepository.findAll();

    _brushIndex = 0;

    _lines = [];
  }

  void attachContext(BuildContext context) {
    _context = context;
  }

  void onPanStart(DragStartDetails details) {
    final point = _getLocalPosition(details.globalPosition);

    final line = LineModel(
      brush: _selectedBrush,
      paths: [
        point,
      ],
    );

    _lines.add(line);

    notify();
  }

  void onPanUpdate(DragUpdateDetails details) {
    final point = _getLocalPosition(details.globalPosition);

    _lines.last.paths.add(point);

    notify();
  }

  void onPanEnd(DragEndDetails details) {
    notify();
  }

  Offset _getLocalPosition(Offset globalPosition) {
    final renderBox = _context.findRenderObject() as RenderBox;

    return renderBox.globalToLocal(globalPosition);
  }
}
