import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

import 'editing_result.dart';

class EditingScreen extends StatefulWidget {
  final String initialText;
  final TextStyle initialTextStyle;

  EditingScreen({required this.initialText, required this.initialTextStyle});
  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  TextEditingController _textEditingController = TextEditingController();
  double _fontSize = 20.0;
  Color _textColor = Colors.black;
  String _selectedFont = 'Arial';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Editor'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textEditingController,
                  style: TextStyle(
                    fontSize: _fontSize,
                    color: _textColor,
                    fontFamily: _selectedFont,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter your text here',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Slider(
                value: _fontSize,
                min: 10.0,
                max: 40.0,
                onChanged: (value) {
                  setState(() {
                    _fontSize = value;
                  });
                },
              ),
              CircleColorPicker(
                //color: _textColor,
                onChanged: (color) {
                  setState(() {
                    _textColor = color;
                  });
                },
              ),
              DropdownButton<String>(
                value: _selectedFont,
                items: [
                  'Arial',
                  'Times New Roman',
                  'Helvetica',
                  'Courier New',
                  'Comic Sans MS',
                  'Roboto',
                  'Montserrat',]
                    .map((String font) {
                  return DropdownMenuItem<String>(
                    value: font,
                    child: Text(font),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFont = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                child: // Inside EditingScreen
IconButton(
  onPressed: () {
    Navigator.pop(
      context,
      EditingResult(
        editedText: _textEditingController.text,
        editedTextStyle: TextStyle(
          fontSize: _fontSize,
          color: _textColor,
          fontFamily: _selectedFont,
        ),
      ),
    );
  },
  icon: const Icon(Icons.done),
  iconSize: 40,
),

              )
            ],
          ),
        ),
      ),
    );
  }
}
