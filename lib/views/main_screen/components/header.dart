import 'package:chatgpt_flutter_case/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .8,
      height: 60,
      child: Center(
        child: RichText(
          text: const TextSpan(
            text: 'reload',
            style: TextStyle(
              color: MainColors.mainGreen,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                  text: '.',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              TextSpan(
                text: 'case',
                style: TextStyle(
                  color: MainColors.mainYellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
