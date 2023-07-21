import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nonPreservingStateProvider = StateProvider((_) => 0);

class NonPreservingStateProvider extends ConsumerWidget {
  const NonPreservingStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(nonPreservingStateProvider);
    ref.listen<int>(
      nonPreservingStateProvider,
      // "next" is referring to the new state.
      // The "previous" state is sometimes useful for logic in the callback.
      (previous, next) {
        if (next >= 5) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Warning'),
                content: const Text(
                    'Counter dangerously high. Consider resetting it.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  )
                ],
              );
            },
          );
        }
      },
    );
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          return Text(counter.toString());
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              ///to reset or delete the state manually
              ref.invalidate(nonPreservingStateProvider);

              ///to return the newly state
              final s = ref.refresh(nonPreservingStateProvider);
              log('initial state before updating: $s');
            },
            child: const Icon(Icons.restart_alt_outlined),
          ),
          const SizedBox(width: 100),
          FloatingActionButton(
            onPressed: () {
              ref.read(nonPreservingStateProvider.notifier).state++;
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
