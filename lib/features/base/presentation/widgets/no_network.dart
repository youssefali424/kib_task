import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kib_task/core/language/index.dart';
import 'package:kib_task/gen/assets.gen.dart';

class NoNetwork extends StatelessWidget {
  final VoidCallback? onRetry;
  const NoNetwork({
    super.key,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.noNetwork.image(width: 50),
          const SizedBox(height: 20),
          Text(
            Translations.noInternet,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(Translations.retry),
          ),
        ],
      ),
    );
  }
}
