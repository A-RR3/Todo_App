// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:training_task1/domain/entities/base_entity.dart';
import 'package:training_task1/utils/data_base_config.dart';

class Task implements BaseEntity {
  int? _id;
  final String? title;
  final String? date;
  final String? time;
  final int categoryId;
  final String? description;
  bool isCompleted;
  DateTime? createdAt;
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

  Map<String, dynamic> _toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'time': time,
      'categoryId': categoryId,
      'description': description,
      'isCompleted': isCompleted == true ? 1 : 0,
    };
  }

  @override
  Map<String, dynamic> get toMap => _toMap();

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        map['id'] != null ? map['id'] as int : null,
        map['title'] != null ? map['title'] as String : null,
        map['date'] != null ? map['date'] as String : null,
        map['time'] != null ? map['time'] as String : null,
        map['categoryId'] as int,
        map['description'] != null ? map['description'] as String : null,
        map['isCompleted'] == 1,
        DateTime.parse(map['createdAt'] as String));
  }

  Task copyWith({
    int? id,
    String? title,
    String? date,
    String? time,
    int? categoryId,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return Task(
      id ?? this.id,
      title ?? this.title,
      date ?? this.date,
      time ?? this.time,
      categoryId ?? this.categoryId,
      description ?? this.description,
      isCompleted ?? this.isCompleted,
      createdAt ?? this.createdAt,
    );
  }

  // @override
  // List<Object?> get props =>
  //     [id, title, date, time, categoryId, description, isCompleted, createdAt];
}
