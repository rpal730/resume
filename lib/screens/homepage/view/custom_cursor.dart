// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:flutter/material.dart';

class CustomCursor extends StatelessWidget {
  final String text;
  const CustomCursor({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(5),
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
    ],
    color: Color(0xFFEFEEEE),
    borderRadius: BorderRadius.circular(12.0),
  ),
      child: Text(
        text,
        style: TextStyle(color: Colors.lightGreen, fontStyle: FontStyle.italic),
      ),
    );
  }
}
