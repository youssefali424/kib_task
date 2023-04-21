import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kib_task/features/currency_convertor/presentation/screens/currency_convertor.dart';

import '../../../gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Stack(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Animate(
                effects: [
                  FadeEffect(duration: 500.milliseconds),
                  ScaleEffect(
                    duration: 500.milliseconds,
                    begin: const Offset(1, 1),
                    end: const Offset(8, 8),
                  ),
                  FadeEffect(
                    duration: 300.milliseconds,
                    delay: 500.milliseconds,
                    end: 0.05,
                  ),
                ],
                delay: 1.seconds,
                onPlay: (_) {
                  Future.delayed(const Duration(milliseconds: 700), () {
                    Navigator.of(context)
                        .pushReplacementNamed(CurrencyConvertorScreen.routeName);
                  });
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                      colors: [Color(0xFF2F76BA), Color(0xFF26A28D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                  child: Assets.images.logo
                      .image(
                        width: 100,
                      )
                      .animate()
                      .fade(duration: 1200.milliseconds, begin: 1, end: 0)),
            )
          ],
        )),
      ),
    );
  }
}
