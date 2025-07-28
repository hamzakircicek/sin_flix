import 'package:flutter/material.dart';

class TextFieldUi extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String prefixAsset;
  final String hintText;
  final String? suffixAsset;
  final bool isPassworKeyboard;

  const TextFieldUi({
    super.key,
    required this.controller,
    required this.prefixAsset,
    required this.hintText,
    required this.validator,
    this.isPassworKeyboard = false,
    this.suffixAsset,
  });

  @override
  State<TextFieldUi> createState() => _TextFieldUiState();
}

class _TextFieldUiState extends State<TextFieldUi> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      cursorColor: Color(0xFFFFFFFF),
      cursorHeight: 17,
      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
      controller: widget.controller,
      obscureText: widget.isPassworKeyboard,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 14, right: 3),
          child: Image.asset(
            widget.prefixAsset,
            width: 20,
            color: Colors.white,
          ),
        ),
        suffixIcon:
            widget.suffixAsset != null
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(widget.suffixAsset!),
                )
                : null,
      ),
    );
  }
}
