import 'package:chatgpt_flutter_case/core/theme/colors.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text('We’ve trained a model called ChatGPT which interacts in a conversational way.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: textPrimary(context),
          )),
    );
  }
}
