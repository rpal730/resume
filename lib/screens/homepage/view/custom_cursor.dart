// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:flutter/material.dart';

class CustomCursor extends StatelessWidget {
  final String text;
  const CustomCursor({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: Colors.lightGreen, fontStyle: FontStyle.italic),
      ),
    );
  }
}
