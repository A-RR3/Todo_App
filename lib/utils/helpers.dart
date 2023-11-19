import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:training_task1/domain/entities/task.dart';

@immutable
class Helpers {
  const Helpers._();

  static Future<DateTime?> selectDate(BuildContext context) async {
    // final controller = Get.find<AddNewTaskController>();
    return await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2101),
        confirmText: 'Choose Time');
  }

  static Future<TimeOfDay?> selectTime(DateTime? date) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: Get.context!,
      initialTime:
          TimeOfDay.fromDateTime(date!), //0:00 Or TimeOfDay(hour:2,minute:30)
    );
    return pickedTime;
  }

  static String formatDayFromDateTime(DateTime date) {
    return DateFormat('EEEEE', 'en_US').format(date);
  }

  static String formatTimeFromDateTime(DateTime? date) {
    return DateFormat("hh:mm a").format(date!).toString();
  }

  static String formatDateFromDateTime(DateTime? date) {
    return DateFormat.yMd('en_US').format(date!);
  }

  static bool isTaskFromSelectedDate(Task task, DateTime selectedDate) {
    final DateTime taskDate = stringToDateTime(task.date!);
    if (taskDate.month == selectedDate.month &&
        taskDate.year == selectedDate.year &&
        taskDate.day == selectedDate.day) {
      return true;
    }
    return false;
  }

  static DateTime stringToDateTime(String dateString) {
    try {
      DateFormat format = DateFormat.yMd();
      return format.parse(dateString);
    } catch (e) {
      return DateTime.now();
    }
  }
}
