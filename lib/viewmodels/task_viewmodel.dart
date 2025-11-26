import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final List<TaskModel> _tasks = [
    TaskModel(
      id: '1',
      title: 'Confirm conference call for Friday',
      subtitle: 'Inbox',
      description: 'No description',
      tag: 'Today',
      status: TaskStatus.inProgress,
    ),
    TaskModel(
      id: '2',
      title: 'Buy movie tickets for tomorrow',
      subtitle: 'Inbox',
      description: 'No description',
      tag: 'Today',
      status: TaskStatus.today,
    ),
    TaskModel(
      id: '3',
      title: 'Read article about fasting',
      subtitle: 'Inbox',
      description: 'No description',
      tag: 'Today',
      status: TaskStatus.today,
    ),
  ];

  List<TaskModel> get tasks => _tasks;

  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(String id, TaskModel updatedTask) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void toggleTaskStatus(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      final currentStatus = _tasks[index].status;
      final newStatus = currentStatus == TaskStatus.completed
          ? TaskStatus.today
          : TaskStatus.completed;
      _tasks[index] = _tasks[index].copyWith(status: newStatus);
      notifyListeners();
    }
  }
}