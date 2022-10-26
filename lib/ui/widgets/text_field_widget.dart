import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const TextFieldWidget({
    Key key,
    @required this.controller,
    @required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent)
        ),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey)
      ),
    );
  }
}
