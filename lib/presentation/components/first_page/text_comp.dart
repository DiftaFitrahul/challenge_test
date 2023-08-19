import 'package:flutter/material.dart';

class TextComp extends StatelessWidget {
  final String title;
  const TextComp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.blue[800], fontSize: 16, fontWeight: FontWeight.w300),
    );
  }
}
