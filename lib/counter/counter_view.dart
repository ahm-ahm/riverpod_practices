import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/counter/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Incremented by:'),
              Consumer(builder: (context, r, _) {
                print('object $r');
                return Text(r.watch(counterProvider).toString());
              }),

              ///=================get the value of counter via ref if you want
              ///to listen the build method again and again just like setstate
              ///otherwise use consumer to listen the state
              // Text(ref.watch(counterProvider).toString())
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ///want to change or notify something eg,function call to increment
            ref.read(counterProvider.notifier).increment();
          }),
    );
  }
}
