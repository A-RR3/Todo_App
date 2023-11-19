// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:training_task1/data/data.dart';

abstract class TasksInteractor {

  Future<int> addTask(Task task);
  Future<int> updateTask(Task task);
  Future<Task> getSingleTask(int id);
  Future<int> deleteTask(Task task);
  Future<List<Task>> readAll();
}
