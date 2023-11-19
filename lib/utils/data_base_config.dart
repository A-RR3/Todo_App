import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppKeys {
  const AppKeys._();
  static const String dbName = 'tasks';
  static const String taskTable = 'task';
  static const String categoryTable = 'category';
}