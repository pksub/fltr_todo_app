import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(String id) onToggle;
  final int index; // 숫자 카운트를 위한 변수 추가

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.index, // 숫자 카운트 초기화
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text(index.toString()), // 숫자 표시
          ),
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
        ),
        const SizedBox(height: 16), // 각 항목 사이에 여백 추가
      ],
    );
  }
}