import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Todo {
  Todo({
    required this.id,
    required this.description,
    required this.completed,
  });

  String id;
  String description;
  bool completed;

  @override
  String toString() {
    return 'id:$id des:$description completed:$completed';
  }
}

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  // Let's allow the UI to add todos.
  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  List<Todo> get getstate => state;

  ///get list
  List<Todo> get todos {
    print('value ${state.length}');
    return state;
  }

  // Let's mark a todo as completed
  void toggle(String todoId) {
    for (final todo in state) {
      if (todo.id == todoId) {
        todo.completed = !todo.completed;

        /// as object id in state changes,so create new list with updated data,otherwise it will not listen l̥uil̥
        state = [...state];
      }
    }
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, dynamic>((ref) {
  return TodosNotifier();
});
int id = 0;

class TodoListViewWithStateNotifierProvider extends ConsumerWidget {
  const TodoListViewWithStateNotifierProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes,listen here
    // final watch = ref.watch(todosProvider.notifier).getstate;

    // final todoProvider = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifierProvider')),
      body: Consumer(builder: (context, reference, _) {
        ///to listen a specific widget ,listen here ie; watch
        reference.watch(todosProvider);
        return ListView(
          children: [
            for (final todo in reference.watch(todosProvider.notifier).todos)
              CheckboxListTile(
                value: todo.completed,
                // When tapping on the todo, change its completed status
                onChanged: (value) {
                  reference.watch(todosProvider);
                  return reference.read(todosProvider.notifier).toggle(todo.id);
                },
                title: Text(todo.description),
              ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        id++;
        ref.read(todosProvider.notifier).addTodo(Todo(
            completed: true, description: 'Simple Description', id: '$id'));
      }),
    );
  }
}
