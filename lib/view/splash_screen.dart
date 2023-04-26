import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../core/core_shelf.dart';
import '../views/main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: () {
          if (isFinished) {
            GVariables.navigator.pushAndRemoveUntil(route: const MainScreen());
          }
        },
        child: Center(
          child: SizedBox(
            width: size.width * .8,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                  onFinished: () {
                    setState(() {
                      isFinished = true;
                    });
                  },
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'reload',
                      cursor: '',
                      speed: const Duration(milliseconds: 70),
                      textStyle: const TextStyle(
                        color: MainColors.mainGreen,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const BlinkText(
                  '.',
                  times: 2,
                  style: TextStyle(
                    color: MainColors.mainYellow,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimatedTextKit(
                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'case',
                      cursor: '',
                      speed: const Duration(milliseconds: 70),
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
