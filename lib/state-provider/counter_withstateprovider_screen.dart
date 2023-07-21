import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class CounterWidgetStateProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. watch the provider and rebuild when the value changes
    final counter = ref.watch(counterStateProvider);
    return ElevatedButton(
      // 2. use the value
      child: Text('Value: $counter'),
      // 3. change the state inside a button callback
      onPressed: () => ref.read(counterStateProvider.notifier).state++,
    );
  }
}
