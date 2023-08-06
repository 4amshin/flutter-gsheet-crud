// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GTextBox extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final void Function()? onDelete;
  const GTextBox({
    Key? key,
    required this.text,
    this.onTap,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.yellow[300],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
