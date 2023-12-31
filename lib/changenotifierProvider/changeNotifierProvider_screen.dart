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
}

class TodosNotifier extends ChangeNotifier {
  final todos = <Todo>[];

  // Let's allow the UI to add todos.
  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  // Let's allow removing todos
  void removeTodo(String todoId) {
    todos.remove(todos.firstWhere((element) => element.id == todoId));
    notifyListeners();
  }

  // Let's mark a todo as completed
  void toggle(String todoId) {
    print('todo id ${todoId}');
    for (final todo in todos) {
      if (todo.id == todoId) {
        todo.completed = !todo.completed;
        notifyListeners();
      }
    }
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});
int id = 0;

class TodoListView extends ConsumerWidget {
  const TodoListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todosProvider).todos;
    print('called');
    // Let's render the todos in a scrollable list view
    return Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifierProvider')),
      body: Consumer(builder: (context, reference, _) {
        return ListView(
          children: [
            for (final todo in todos)
              CheckboxListTile(
                value: todo.completed,
                // When tapping on the todo, change its completed status
                onChanged: (value) =>
                    reference.read(todosProvider.notifier).toggle(todo.id),
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
