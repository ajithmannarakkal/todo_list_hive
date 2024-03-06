class TaskListModel {
  String title;
  String? description;
  DateTime date;
  bool status;
  TaskListModel(
      {required this.title,
      this.description,
      required this.date,
      required this.status});
}
