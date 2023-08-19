import 'package:flutter/material.dart';

class FloatingTitle extends StatelessWidget {
  final String title;
  const FloatingTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.green[100]?.withOpacity(0.7),
            border: Border.all(
              color: Colors.green[800] ?? Colors.green,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.green[800],
                fontSize: 11,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
