class TaskModel {
  final String? id;
  final String? uid;
  final String? title;
  final String? desc;
  final String? priority;
  final String? status;
  final DateTime? dueDate;

  TaskModel({
    this.id,
    this.uid,
    this.title,
    this.desc,
    this.status,
    this.priority,
    this.dueDate,
  });

  TaskModel copyWith({
    String? id,
    String? uid,
    String? title,
    String? desc,
    String? status,
    String? priority,
    DateTime? dueDate,
  }) {
    return TaskModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  TaskModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        uid = json['uid'] as String?,
        title = json['title'] as String?,
        desc = json['desc'] as String?,
        priority = json['priority'] as String?,
        status = json['status'] as String?,
        dueDate = DateTime.parse(json['dueDate']?? '');

  Map<String, dynamic> toJson() => {
    'id' : id,
    'uid' : uid,
    'title' : title,
    'desc' : desc,
    'priority' : priority,
    'status' : status,
    'dueDate' : dueDate!.toIso8601String()
  };
}