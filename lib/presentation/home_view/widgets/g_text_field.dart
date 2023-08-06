// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function()? onClear;
  const GTextfield({
    Key? key,
    this.controller,
    this.hintText,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: onClear,
          icon: const Icon(
            Icons.clear,
            size: 20,
          ),
        ),
      ),
    );
  }
}
