import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/asyncValue/async_value_screen.dart';
import 'package:riverpod_demo/changenotifierProvider/changeNotifierProvider_screen.dart';
import 'changenotifierProvider/StateNotifierProvider_screen.dart';
import 'counter/counter_view.dart';
import 'counter-with-state-provider/counter_screen.dart';
import 'hello-world/hello_world_screen.dart';
import 'list-provider/list_provider_screen.dart';
import 'non-preserving-state-provider/non-preserving-state-provider-screen.dart';
import 'notifier/notifier_counter_screen.dart';
import 'post-riverpod-request/album_screen.dart';
import 'provider-observable/providerobservable.dart';
import 'restapi-get-request-riverpod/homepage.dart';
import 'state-provider/counter_withstateprovider_screen.dart';

void main() {
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const NotifierCounterScreeen(),
      home: const AyncValueScreen(),
      // home: HelloWorldScreen(),
      // home: CounterScreen(),
      // home: TodoListView(),
      // home: ProviderObservable(),
      // home: TodoListViewWithStateNotifierProvider(),
    );
  }
}
