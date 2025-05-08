import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'add_todo_screen.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Todo> _todos = [];

  void _addTodo(String title, String description) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
      description: description,
    );

    setState(() {
      _todos.add(newTodo);
    });
  }

  void _toggleTodoCompletion(String id) {
    setState(() {
      final todo = _todos.firstWhere((todo) => todo.id == id);
      todo.toggleCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80), // 아래쪽에 여유 공간 추가
        itemCount: _todos.isEmpty ? 0 : _todos.length,
        itemBuilder: (ctx, index) {
          return TodoItem(
            todo: _todos[index],
            onToggle: _toggleTodoCompletion,
            index: index + 1, // 숫자 카운트를 전달
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => AddTodoScreen(onAddTodo: _addTodo),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}