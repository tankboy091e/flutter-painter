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
  void initState() {
    _initializeDependency();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DrawingEditorView oldWidget) {
    _initializeDependency();

    super.didUpdateWidget(oldWidget);
  }

  void _initializeDependency() {
    widget.controller.attach(this);
    widget.controller.attachContext(context);
  }

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.yellow,
                  child: CustomPaint(
                    painter: Painter(
                      lines: widget.controller.paintLines,
                      eraseLine: widget.controller.eraseLine,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0;
                        i < widget.controller.brushColors.length * 2 - 1;
                        i++)
                      if (i % 2 == 1)
                        const SizedBox(width: 12.0)
                      else
                        GestureDetector(
                          onTap: () => widget.controller.onSelectBrush(i ~/ 2),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.controller.brushColors[i ~/ 2],
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 4.0,
                                    color: Theme.of(context).primaryColor,
                                  )
                                ]),
                          ),
                        )
                  ],
                ),
                const SizedBox(height: 12.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
