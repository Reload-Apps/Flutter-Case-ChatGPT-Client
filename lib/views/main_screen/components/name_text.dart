import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

class NameText extends StatelessWidget {
  const NameText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: 'AI',
        style: TextStyle(
          color: MainColors.mainGreen,
          fontSize: 52,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: ' Chatbot',
            style: TextStyle(
              color: MainColors.mainYellow,
              fontSize: 52,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
