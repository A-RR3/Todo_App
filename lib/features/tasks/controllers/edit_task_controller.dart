import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:training_task1/data/data.dart';
import 'package:training_task1/domain/interactors/impl/task_interactor_impl.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/features/tasks/screens/Edit-category-screen.dart';
import 'package:training_task1/features/tasks/screens/edit_title_screen.dart';
import 'package:training_task1/utils/helpers.dart';

class EditTaskController extends GetxController {
  int categoryId = 0;
  DateTime? selectedDate = DateTime.now();
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  // RxBool errorState = false.obs;
  final RxString titleErrorText = ''.obs;
  final RxString emptyFieldError = ''.obs;
  var titleErrorState = false.obs;
  var emptyDescription = false.obs;
  var emptyTitle = false.obs;
  var dateIsUpdated = false.obs;
  bool categoryIsUpdated = false;
  late Category category;

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController!.dispose();
    descriptionController!.dispose();
    super.onClose();
  }

  Future<void> selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await Helpers.selectDate(context);
    TimeOfDay? pickedTime = TimeOfDay.now();
    if (pickedDate != null) {
      pickedTime = await Helpers.selectTime(pickedDate);
      if (pickedTime != null) {
        selectedDate = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, pickedTime.hour, pickedTime.minute);
        dateIsUpdated.value = true;
      }
    }
  }

  String formatUpdatedDate() {
    String day = Helpers.formatDayFromDateTime(selectedDate!);
    String time = Helpers.formatTimeFromDateTime(selectedDate);
    return '$day At $time';
  }

  void onChangeCategory() {
    Get.dialog(EditCategoryScreen());
  }

  void onCategoryTypePressed(int index) {
    print('pressed');
    categoryId = index;
    categoryIsUpdated = true;
    final homeController = Get.find<HomeController>();
    category = homeController.categoriesList
        .firstWhere((element) => element.id == index);
    update(['category']);
  }

  void onEditIconPressed(Task task) async {
    await Get.dialog(EditTaskTitle(task: task));
  }

  void updateErrorText(String value) {
    titleErrorText.value = _validateInput(value) ?? '';
  }

  String? _validateInput(String value) {
    if (value.length > 25) {
      titleErrorState.value = true;
      return 'Title length should be less than or equal to 25 characters.';
    }
    titleErrorState.value = false;
    return null;
  }

  void _validateIsEmpty() {
    titleController!.text.isEmpty
        ? emptyTitle.value = true
        : emptyTitle.value = false;

    descriptionController!.text.isEmpty
        ? emptyDescription.value = true
        : emptyDescription.value = false;
  }

  void onEditTitlePressed() {
    _validateIsEmpty();
    if (!emptyDescription.value &&
        !emptyTitle.value &&
        !titleErrorState.value) {
      Get.back();
    }
    //  else {
    //   print('snackBar');
    //   Get.snackbar('Invalid Data', 'Please enter valid title and description',
    //       isDismissible: true,
    //       dismissDirection: DismissDirection.up,
    //       snackPosition: SnackPosition.TOP);
    // }
  }

  void onEditBottonPressed(Task task) {
    print('pressed');

    String timeFormat = Helpers.formatTimeFromDateTime(selectedDate);
    String dateFormat = Helpers.formatDateFromDateTime(selectedDate);
    Task updatedTask = task.copyWith(
        id: task.id,
        title: titleController!.text,
        description: descriptionController!.text,
        categoryId: categoryId,
        date: dateFormat,
        time: timeFormat,
        isCompleted: false);

    TasksInteractorImpl service = TasksInteractorImpl();
    service.updateTask(updatedTask);
    // Get.find<HomeController>().taskList[task.id!] = updatedTask;
    Get.find<HomeController>().getTasks();
  }

  // Future<void> sharePressed(Task task) async {
  //   await Share.share(_sharedMessage(task),subject: "I've shared this ToDo with you!");
  // }

  // String _sharedMessage(Task task) {
  //   return '''Title: ${task.title}\n
  //   Description: ${task.description}\n
  //   DueDate: ${task.date}\n
  //   Category: ${category.name}''';
  // }
}
