import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/counter-with-state-provider/counter_state_provider.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. watch the provider and rebuild when the value changes
    final counter = ref.watch(counterStateProvider);
    log('rebuild   $counter');

    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          final count = ref.watch(counterStateProvider.state).state;

          return ElevatedButton(
            // 2. use the value
            child: Text('Value: $count'),
            // 3. change the state inside a button callback
            onPressed: () => ref.read(counterStateProvider.notifier).state++,
          );
        }),
      ),
    );
  }
}
