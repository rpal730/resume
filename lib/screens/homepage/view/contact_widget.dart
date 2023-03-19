import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final Color color;
  const ContactWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SelectableText(
            'C O N T A C T',
            style: TextStyle(color: color, fontSize: 30),
          ),
          SelectableText(''),
          SelectableText(
            'Email - rpal730@gmail.com',
            style: TextStyle(color: color, fontSize: 15),
          ),
          SelectableText(
            'Phone - 9582606442',
            style: TextStyle(color: color, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
