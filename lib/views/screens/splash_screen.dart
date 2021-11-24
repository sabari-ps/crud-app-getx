import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/splash.png',
            fit: BoxFit.contain,
            width: 350.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 8.0,
            ),
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                ColorizeAnimatedText(
                  "STUDAPP",
                  colors: [
                    Colors.orange,
                    Colors.purple,
                  ],
                  speed: const Duration(
                    milliseconds: 500,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 40.0,
                    decoration: TextDecoration.none,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 150.0,
            child: LinearProgressIndicator(),
          )
        ],
      ),
    );
  }
}
