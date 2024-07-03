class Todo {
  final int id;
  final String title;
  final String description;
  final bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isDone: json['isDone'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isDone': isDone,
      };
}
