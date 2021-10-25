import 'package:drawing_tool/app/interfaces/controller.dart';
import 'package:drawing_tool/app/models/brush.dart';
import 'package:drawing_tool/app/models/line.dart';
import 'package:drawing_tool/app/repository/brush.dart';
import 'package:flutter/cupertino.dart';

class DrawingEditorController extends Controller {
  final BrushRepository brushRepository;

  late BuildContext _context;

  late List<BrushModel> _brushs;

  List<Color> get brushColors => _brushs.map((e) => e.color).toList();

  late int _brushIndex;

  int get brushIndex => _brushIndex;

  BrushModel get _selectedBrush => _brushs[_brushIndex];

  late List<LineModel> _paintLines;

  List<LineModel> get paintLines => _paintLines;

  late LineModel _eraseLine;

  LineModel get eraseLine => _eraseLine;

  List<LineModel> get _currentLines {
    return _paintLines;
  }

  late Offset _lastOrigin;

  DrawingEditorController({
    required this.brushRepository,
  }) {
    _brushs = brushRepository.findAll();

    _brushIndex = 0;

    _paintLines = [];

    _eraseLine = LineModel(
      brush: _brushs
          .firstWhere((element) => element.brushType == BrushType.eraser),
      paths: [],
    );
  }

  void attachContext(BuildContext context) {
    _context = context;
  }

  void onPanStart(DragStartDetails details) {
    _lastOrigin = Offset.zero;

    final point = _getLocalPosition(details.globalPosition);

    _createFirstPoint(point);

    notify();
  }

  void _createFirstPoint(Offset point) {
    final line = LineModel(
      brush: _selectedBrush,
      paths: [point],
    );

    _currentLines.add(line);
  }

  void onPanUpdate(DragUpdateDetails details) {
    _lastOrigin += details.delta;

    if (_lastOrigin.distance < 1) {
      return;
    }

    _lastOrigin = Offset.zero;

    final point = _getLocalPosition(details.globalPosition);

    _addConitunousPoint(point);

    notify();
  }

  void _addConitunousPoint(Offset point) {
    _currentLines.last.paths.add(point);
  }

  void onPanEnd(DragEndDetails details) {
    notify();
  }

  Future<void> onSelectBrush(int index) async {
    _brushIndex = index;

    notify();
  }

  Offset _getLocalPosition(Offset globalPosition) {
    final renderBox = _context.findRenderObject() as RenderBox;

    return renderBox.globalToLocal(globalPosition);
  }
}
