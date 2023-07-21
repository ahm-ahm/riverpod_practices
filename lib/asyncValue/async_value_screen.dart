import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_demo/changenotifierProvider/changeNotifierProvider_screen.dart';

class Todo {
  Todo({
    required this.title,
  });

  String title;

  factory Todo.fromJson(json) {
    return Todo(title: json['title']);
  }
}

final todosProvider = FutureProvider<List<Todo>>((ref) async {
  final res = await Future.delayed(const Duration(seconds: 3), () {
    return get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
  });

  final asJson = jsonDecode(res.body);
  print('json data--------------$asJson');
  return asJson.map<Todo>((json) => Todo.fromJson(json)).toList();
});

class AyncValueScreen extends ConsumerWidget {
  const AyncValueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Todo>> _todos = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _todos.when(
        data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(data[index].title),
                )),
        error: (e, s) => const Center(
          child: Text('Uh oh. Something went wrong!'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
