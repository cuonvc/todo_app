import 'package:flutter/material.dart';

class TodoEditor extends StatelessWidget {

  final VoidCallback onTap;

  TodoEditor({
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.red,
        child: Text("Teststets"),
      ),
    );
  }
}