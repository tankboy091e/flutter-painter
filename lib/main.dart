import 'package:drawing_tool/app/controllers/drawing_editor.dart';
import 'package:drawing_tool/app/repository/brush.dart';
import 'package:drawing_tool/app/views/drawing_editor.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrawingEditorView(
        controller: DrawingEditorController(
          brushRepository: BrushRepository(),
        ),
      ),
    );
  }
}
