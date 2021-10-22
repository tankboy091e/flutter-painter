import 'package:drawing_tool/app/controllers/drawing_editor.dart';
import 'package:drawing_tool/app/interfaces/view.dart';
import 'package:drawing_tool/app/widgets/sketcher.dart';
import 'package:flutter/material.dart';

class DrawingEditorView extends StatefulWidget {
  final DrawingEditorController controller;

  const DrawingEditorView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<DrawingEditorView> createState() => _DrawingEditorViewState();
}

class _DrawingEditorViewState extends ViewState<DrawingEditorView> {
  @override
  Widget build(BuildContext context) {
    widget.controller.attach(this);
    widget.controller.attachContext(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onPanStart: widget.controller.onPanStart,
              onPanUpdate: widget.controller.onPanUpdate,
              onPanEnd: widget.controller.onPanEnd,
              child: RepaintBoundary(
                child: Container(
                  color: Colors.red,
                  child: CustomPaint(
                    painter: Sketcher(
                      lines: widget.controller.lines,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
