// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:training_task1/domain/entities/base_entity.dart';
import 'package:training_task1/utils/data_base_config.dart';

class Task implements BaseEntity {
  int? _id;
  String? title;
  String? date;
  String? time;
  int categoryId;
  String? description;
  bool isCompleted;
  final DateTime? createdAt;
  Task(this._id, this.title, this.date, this.time, this.categoryId,
      this.description, this.isCompleted, this.createdAt);

  Task.create(
      {required this.title,
      required this.date,
      required this.time,
      required this.categoryId,
      required this.description,
      this.isCompleted = false,
      this.createdAt});

  @override
  int? get id => _id;
  @override
  String get table => AppKeys.taskTable;

  @override
  Map<String, dynamic> toMap() => {
      'title': title,
      'date': date,
      'time': time,
      'categoryId': categoryId,
      'description': description,
      'isCompleted': isCompleted == true ? 1 : 0,
    };

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        map['id'],
        map['title'],
        map['date'],
        map['time'],
        map['categoryId'] as int,
        map['description'] != null ? map['description'] as String : null,
        map['isCompleted'] == 1,
        DateTime.parse(map['createdAt']));
  }
  
}
