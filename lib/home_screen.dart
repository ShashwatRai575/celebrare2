import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'editing_screen.dart';
import 'editing_result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Undo Redo Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String sampleText = 'Sample Text';
  TextStyle sampleTextStyle = TextStyle(color: Colors.black, fontSize: 28);

  List<String> undoList = [];
  List<String> redoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Undo Redo Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: undoList.isEmpty ? null : undo,
          ),
          IconButton(
            icon: Icon(Icons.redo),
            onPressed: redoList.isEmpty ? null : redo,
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/sample.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditingScreen(
                      initialText: sampleText,
                      initialTextStyle: sampleTextStyle,
                    ),
                  ),
                );
                if (result != null && result is EditingResult) {
                  undoList.add(sampleText);
                  redoList.clear();
                  setState(() {
                    sampleText = result.editedText;
                    sampleTextStyle = result.editedTextStyle;
                  });
                }
              },
              child: DottedBorder(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    sampleText,
                    style: sampleTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void undo() {
    if (undoList.isNotEmpty) {
      redoList.add(sampleText);
      sampleText = undoList.removeLast();
      updateState();
    }
  }

  void redo() {
    if (redoList.isNotEmpty) {
      undoList.add(sampleText);
      sampleText = redoList.removeLast();
      updateState();
    }
  }

  void updateState() {
    setState(() {
      // Update sampleText and other state variables here if needed.
    });
  }
}
