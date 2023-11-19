import 'package:training_task1/data/data.dart';
import 'package:training_task1/domain/gateway/task_services.dart';

class TasksInteractorImpl implements TasksInteractor {
  final TaskServices _gateway;
  TasksInteractorImpl() : _gateway = TaskServices();

  @override
  Future<int> addTask(Task task) async {
    return await _gateway.addTask(task);
  }

  @override
  Future<int> deleteTask(Task task) async {
    return await _gateway.deleteTask(task);
  }

  @override
  Future<List<Task>> readAll() async {
    return await _gateway.readAll();
  }

  @override
  Future<Task> getSingleTask(int id) async {
    return await _gateway.getSingleTask(id);
  }

  @override
  Future<int> updateTask(Task task) async {
    return await _gateway.update(task);
  }

  // @override
  // Future<int> updateTask(Task task) async {
  //   try {
  //     return await _gateway.updateTask(task);
  //   } catch (e) {
  //     throw '$e';
  //   }
  // }
}









  // @override
  // Future<int> checkTaskIsCompleted(Task task) {
  //    try {
  //     return await _gateway.checkTaskIsCompleted(task);
  //   } catch (e) {
  //     throw '$e';
  //   }
  // }

























  