class Todo {
  String? id;
  String title;
  String? description;
  bool isDone;
  String? updatedAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
    required this.updatedAt
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    isDone: json['isDone'],
    updatedAt: json['updatedAt']
  );

}