

import 'package:flutter/material.dart';

typedef CaretMoved = void Function(Offset globalCaretPosition);
typedef TextChanged = void Function(String text);

class TextInputField extends StatefulWidget {
  String labelText;
  final IconData icon;
  final TextChanged? onTextChanged;

  TextInputField({
    this.onTextChanged,
    required this.labelText,
    required this.icon,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final GlobalKey _fieldKey = GlobalKey();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController.addListener(() {
      if (widget.onTextChanged != null) {
        widget.onTextChanged!(_textController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      key: _fieldKey,
      style: const TextStyle(color: Colors.white),
      controller: _textController,
      decoration: InputDecoration(
        focusColor: Colors.white54,
        hoverColor: Colors.white,
        fillColor: Colors.white54,
        labelText: widget.labelText,
        prefixIcon: Icon(widget.icon, color: Colors.white54),
        labelStyle: const TextStyle(
          color: Colors.white54,
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
      ),
    );
  }
}
