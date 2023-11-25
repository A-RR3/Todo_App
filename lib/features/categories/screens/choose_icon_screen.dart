import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChooseIconScreen extends StatelessWidget {
  ChooseIconScreen({super.key});
  List<IconData> icons = [
    Icons.work,
    Icons.flight,
    Icons.people,
    Icons.shopping_bag,
    Icons.medical_services,
    Icons.favorite,
    Icons.person,
    Icons.home
  ];
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: SizedBox(
          width: Get.width * .4,
          height: Get.height * .3,
          child: Column(children: [
            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                children: List.generate(
                    icons.length,
                    (index) => IconButton(
                          onPressed: () => Get.back(result: icons[index]),
                          icon: Icon(icons[index]),
                        ))),
          ]),
        ));
  }
}
