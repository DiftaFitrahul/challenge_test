import 'package:flutter/material.dart';

class SensorComp extends StatelessWidget {
  final String title;
  const SensorComp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.blue[800], fontSize: 16, fontWeight: FontWeight.w300),
      ),
    );
  }
}
