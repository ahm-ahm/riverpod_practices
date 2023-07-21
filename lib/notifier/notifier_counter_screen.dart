import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'notifier_provider.dart';

class NotifierCounterScreeen extends ConsumerWidget {
  const NotifierCounterScreeen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(myNotifierProvider);
    print('build');
    return Scaffold(
      // 1. watch the provider and rebuild when the value changes
      body: Center(
        child: ElevatedButton(
          // 2. use the value
          child: Text('Value: $counter'),
          // 3. change the state inside a button callback
          onPressed: () => ref.read(myNotifierProvider.notifier).state++,
        ),
      ),
    );
  }
}
