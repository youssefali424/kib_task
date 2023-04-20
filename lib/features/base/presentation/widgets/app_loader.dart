import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kib_task/gen/assets.gen.dart';

class AppLoader extends StatelessWidget {
  final bool? isLoading;

  final Widget? child;
  final StackFit? fit;
  final bool disableKeyboardDismiss;
  const AppLoader({
    Key? key,
    this.isLoading,
    this.child,
    this.fit,
    this.disableKeyboardDismiss = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disableKeyboardDismiss
          ? null
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
      child: Stack(
        fit: fit ?? StackFit.expand,
        children: [
          if (child != null) child!,
          if (isLoading ?? false)
            Positioned.fill(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Assets.images.loading
                      .image(
                        width: 70,
                        height: 70,
                      )
                      .animate(
                        onPlay: (controller) => controller.repeat(reverse: true),
                      )
                      .scale(
                          duration: 1500.milliseconds,
                          begin: const Offset(0.5, 0.5),
                          end: const Offset(1.5, 1.5))
                      .fade(
                        begin: 1,
                        end: 0.1,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
