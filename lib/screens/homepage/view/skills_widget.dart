import 'package:flutter/material.dart';

class SkillsWidget extends StatelessWidget {
  final Color color;
  const SkillsWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.square(
          dimension: 20,
        ),
        SelectableText(
          'S K I L L S',
          style: TextStyle(color: color, fontSize: 30),
        ),
        SelectableText(''),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                SelectableText(
                  'Dart',
                  style: TextStyle(color: color, fontSize: 15),
                ),
                SelectableText(
                  'Flutter',
                  style: TextStyle(color: color, fontSize: 15),
                ),
                SelectableText(
                  'Postman',
                  style: TextStyle(color: color, fontSize: 15),
                ),
                SelectableText(
                  'Android Studio',
                  style: TextStyle(color: color, fontSize: 15),
                ),
                SelectableText(
                  'Vscode',
                  style: TextStyle(color: color, fontSize: 15),
                ),
                SelectableText(
                  'Version Provisioning tools',
                  style: TextStyle(color: color, fontSize: 15),
                ),
                SelectableText(
                  'Postman',
                  style: TextStyle(color: color, fontSize: 15),
                ),
                SelectableText(
                  'Swagger',
                  style: TextStyle(color: color, fontSize: 15),
                ),
              ],
            ),
            Flexible(
              child: Column(
                children: [
                  SelectableText(
                    'Bloc',
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  SelectableText(
                    'Provider',
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  SelectableText(
                    'Stacked',
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  SelectableText(
                    'Getx',
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  SelectableText(
                    'Figma',
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  SelectableText(
                    'AdobeXD',
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  SelectableText(
                    'Rest APIs integration',
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  SelectableText(
                    'MVC, MVVM & Clean architectures',
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
