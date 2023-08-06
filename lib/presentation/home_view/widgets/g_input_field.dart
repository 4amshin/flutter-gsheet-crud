// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:koko_note/presentation/home_view/widgets/g_button.dart';
import 'package:koko_note/presentation/home_view/widgets/g_text_field.dart';

class GInputField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? onClear;
  final void Function()? onPost;
  const GInputField({
    Key? key,
    this.controller,
    this.onClear,
    this.onPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          GTextfield(
            controller: controller,
            hintText: "Enter......",
            onClear: onClear,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('@ c r e a t e d b y r e l y'),
                GButton(
                  text: 'Post',
                  onTap: onPost,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
