import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/features/categories/controllers/create_category_controller.dart';

// ignore: must_be_immutable
class ChooseColorScreen extends StatelessWidget {
  ChooseColorScreen({super.key});
  final controller = Get.put(CreateCategoryController());

  // final controller = Get.find<CreateCategoryController>();

  List<int> colorsList = [
    category1,
    category2,
    category3,
    category4,
    category5,
    category6,
    category7,
    category8,
    redAccent,
    orangeAccent,
    hotPink,
    lightYellow,
    yellowAccent,
    purple
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              colorsList.length,
              (index) => InkWell(
                    onTap: () {
                      controller.setCategoryColor(colorsList[index]);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(colorsList[index])),
                        child: GetBuilder<CreateCategoryController>(
                          builder: (_) {
                            return controller.selectedCategoryColor ==
                                    colorsList[index]
                                ? const Icon(
                                    Icons.check,
                                    size: 20,
                                  )
                                : const Text('');
                          },
                        )),
                  ))),
    );
  }
}


 



        //       ListView.separated(
        //   itemCount: colorsList.length,
        //   itemBuilder: (context, index) {
        //     return InkWell(
        //         onTap: () {},
        //         child: Container(
        //           height: 50,
        //           width: 50,
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: Color(colorsList[index]),
        //           ),
        //         ));
        //   },
        //   separatorBuilder: (context, index) => const Gap(8),
        // ),