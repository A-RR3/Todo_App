import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/features/categories/screens/create_category_screen.dart';
import 'package:training_task1/features/categories/widgets/material_botton.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/features/tasks/controllers/add_new_task_controller.dart';
import '../widgets/category_item.dart';

class ChooseCategoryScreen extends StatelessWidget {
  ChooseCategoryScreen({super.key});

  final addNewTaskController = Get.find<AddNewTaskController>();

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

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
              Obx(
                () => Expanded(
                  child: GridView.builder(
                    itemCount: homeController.categoriesList.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      var categories = homeController.categoriesList.toList();

                      if (index < categories.length) {
                        return CategoryItem(
                          icon: categories[index].icon,
                          name: categories[index].name,
                          color: categories[index].color,
                          onTap: () {
                            //function in the add task screen that changes tha value of category id
                            addNewTaskController
                                .onCategoryTypePressed(index + 1);

                            print(index + 1);
                            print(categories[index].id);
                          },
                        );
                      } else {
                        return CategoryItem(
                          icon: Icons.add,
                          name: 'Create New',
                          color: greyShadow.withGreen(105),
                          onTap: () => Get.to(() => CreateCategoryScreen()),
                        );
                      }
                    },
                  ),
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

  // Expanded(
  //                 child: GridView(
  //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                         crossAxisCount: 3),
  //                     children: List.generate(
  //                         3,
  //                         (index) => Container(
  //                               color: Colors.red,
  //                               child: Text("${index}"),
  //                             ))))