import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kib_task/features/base/presentation/bloc/base_bloc_state.dart';
import 'package:kib_task/features/base/presentation/widgets/app_loader.dart';
import 'package:riverbloc/riverbloc.dart';

import 'no_network.dart';

class ScreenHandler<T extends BlocBase<S>, S extends BaseBlocState>
    extends ConsumerWidget {
  final BlocProvider<T, S> provider;
  final VoidCallback? onRetry;
  final Widget? child;
  final StackFit? fit;

  const ScreenHandler({
    Key? key,
    required this.provider,
    this.onRetry,
    this.child,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(provider, (_, state) {
      var message = state.message;
      if (message.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      }
    });
    var hasNoConnection =
        ref.watch(provider.select((value) => value.hasNoConnection));
    if (hasNoConnection) {
      return NoNetwork(
        onRetry: onRetry,
      );
    }
    var isLoading = ref.watch(provider.select((value) => value.isLoading));
    return AppLoader(
      isLoading: isLoading,
      fit: fit,
      child: child,
    );
  }
}
