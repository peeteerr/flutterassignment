class TaskModelDay3 {
  int id;
  String title;
  bool isDone;
  String createdDate;

  TaskModelDay3({required this.id, required this.title, required this.isDone, required this.createdDate});

  factory TaskModelDay3.fromJson(Map json) {
    return TaskModelDay3(id: json['ID'], title: json['Title'], isDone: json['IsDone'], createdDate: json['CreatedDate']);
  }
}
