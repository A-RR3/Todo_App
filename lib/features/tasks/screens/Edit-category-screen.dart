import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/features/categories/widgets/category_item.dart';
import 'package:training_task1/features/categories/widgets/material_botton.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/features/tasks/controllers/edit_task_controller.dart';

class EditCategoryScreen extends StatelessWidget {
  EditCategoryScreen({super.key});

  final editTaskController = Get.find<EditTaskController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: greyShadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: SizedBox(
          height: Get.height * 0.65,
          width: Get.width * .75,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Choose Category',
                  style: textTheme(18, null, null),
                ),
              ),
              const Divider(
                thickness: 2,
                height: 40,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: homeController.categoriesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    var categories =
                        homeController.categoriesList.toList();
                    return CategoryItem(
                      icon: categories[index].icon,
                      name: categories[index].name,
                      color: categories[index].color,
                      onTap: () {
                        //function in the add task screen that changes tha value of category id
                        editTaskController.onCategoryTypePressed(index + 1);

                        print(index + 1);
                        print(categories[index].id);
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MyMaterialBotton(
                        onPress: () => Get.back(),
                        text: 'Cancel',
                        textColor: primaryColor),
                  ),
                  Expanded(
                    child: MyMaterialBotton(
                      onPress: () => Get.back(),
                      text: 'Choose',
                      textColor: Colors.white,
                      bottonColor: primaryColor,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
