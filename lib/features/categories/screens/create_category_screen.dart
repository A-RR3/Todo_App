import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/values.dart';
import 'package:training_task1/features/categories/controllers/create_category_controller.dart';
import 'package:training_task1/features/categories/screens/choose_color_screen.dart';
import 'package:training_task1/features/categories/widgets/labeled_text_field.dart';
import 'package:training_task1/features/categories/widgets/material_botton.dart';
import 'package:training_task1/core/widgets/common_text_field.dart';

class CreateCategoryScreen extends StatelessWidget {
  CreateCategoryScreen({super.key});
  final controller = Get.put(CreateCategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: Get.height * .87,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create New Category',
                          style: textTheme(20, null, null),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LabeledWidget(
                          label: 'Category name:',
                          controller: controller.categoryNameController!,
                          widget: CommonTextField(
                            hintText: 'Category Name',
                            controller: controller.categoryNameController!,
                          ),
                        ),
                        LabeledWidget(
                          label: 'Category icon',
                          widget: InkWell(
                            onTap: () {
                              controller.onChooseIconBottonPressed();
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: greyShadow,
                                  border: Border.all(
                                      color: Colors.white70, width: 1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: GetBuilder<CreateCategoryController>(
                                    builder: (_) {
                                  IconData? icon =
                                      controller.selectedCategoryIcon;
                                  return icon != null
                                      ? Icon(icon)
                                      : const Text(
                                          'Choose Icon from library',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        );
                                })),
                          ),
                        ),
                        Text(
                          'Category Color',
                          style: textTheme(20, null, null),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ChooseColorScreen(),
                      ],
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
                          onPress: () {
                            controller.createCategory;
                            Get.back();
                          },
                          text: 'Create Category',
                          textColor: Colors.white,
                          bottonColor: primaryColor,
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
