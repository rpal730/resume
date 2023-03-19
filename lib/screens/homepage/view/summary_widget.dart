import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final Color color;
  const SummaryWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectableText(
          'S U M M A R Y',
          style: TextStyle(color: color, fontSize: 30),
        ),
        SelectableText(''),
        SelectableText(
          'Experience - 3+ years',
          style: TextStyle(color: color, fontSize: 15),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SelectableText(
              'My passion for designing useful and appealing mobile application software is what drives me to pursue this career, and my eye for design and user-driven approach to development make me an ideal candidate. If you think I’d be a good fit for your company, then please reach out to set up an interview.', style: TextStyle(color:color, fontSize: 15),),
        )
      ],
    );
  }
}
