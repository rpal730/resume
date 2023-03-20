import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  final Color color;
  const FooterWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      '# #     T H E S E   V I O L E N T   D E L I G H T S   H A V E   V I O L E N T   E N D S     # #',
      style: TextStyle(color: color, fontSize: 20),
    );
  }
}
