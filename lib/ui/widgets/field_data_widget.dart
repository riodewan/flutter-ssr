import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldDataWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  const FieldDataWidget({
    Key key,
    @required this.controller,
    @required this.label,
    @required this.hint
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
      child: TextField(
        controller: controller,
        readOnly: true,
        autofocus: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          labelText: label,
          hintText: hint
        ),
      ),
    );
  }
}
