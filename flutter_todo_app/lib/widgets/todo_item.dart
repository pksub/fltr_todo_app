import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(String id) onToggle;

  const TodoItem({super.key, required this.todo, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(todo.description),
      trailing: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) => onToggle(todo.id),
      ),
    );
  }
}