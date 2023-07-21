import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'hello_world_provider.dart';

class HelloWorldScreen extends HookConsumerWidget {
  const HelloWorldScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String helloWorld = ref.watch(helloWorldProvider);
    log('build------$helloWorld');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello world provider'),
      ),
      body: Center(child: Text(helloWorld)),
    );
  }
}
