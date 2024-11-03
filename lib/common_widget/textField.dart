// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class customTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  int maxline;
  customTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.maxline=1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
      // ignore: body_might_complete_normally_nullable
      validator: ((value) {
        if (value == null || value.isEmpty) {
          return hint;
        }
      }),
      maxLines: maxline,
    );
  }
}
