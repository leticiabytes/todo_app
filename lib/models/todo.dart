class ToDo {
  String? id;
  String? description;
  bool isDone;

  ToDo({
    required this.id,
    required this.description,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', description: 'Lorem ipsum dot a met', isDone: false),
      ToDo(id: '02', description: 'Lorem ipsum dot a met', isDone: true),
    ];
  }
}
