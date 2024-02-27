class Todo {
  String? id;
  String title;
  String? description;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
      id: json['id'],
      title: json['title'],
      description: json['description']
  );

  static List<Todo> todoList() {
    return [
      // Todo(id: "01", description: "Fix bug on Bookcar backend"),
      // Todo(id: "02", description: "Về nhà cuối tuần"),
      // Todo(id: "03", description: "Lên trường hôm nay", isDone: true),
      // Todo(id: "04", description: "Đóng họ môn Kiểm thử", isDone: true),
      // Todo(id: "05", description: "Học Flutter code Todo App"),
      // Todo(id: "06", description: "Sửa lỗi không hiển thị giao diện", isDone: true),
      // Todo(id: "07", description: "Nhớ người yêu..."),
    ];
  }
}