class TaskModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String tag;
  final TaskStatus status;

  TaskModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tag,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'tag': tag,
      'status': status.toString(),
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      tag: json['tag'],
      status: TaskStatus.values.firstWhere(
            (e) => e.toString() == json['status'],
        orElse: () => TaskStatus.today,
      ),
    );
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? description,
    String? tag,
    TaskStatus? status,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      tag: tag ?? this.tag,
      status: status ?? this.status,
    );
  }
}

enum TaskStatus {
  today,
  inProgress,
  completed,
}