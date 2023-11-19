import 'package:flutter/material.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/domain/entities/categories.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final bool isCompleted;

  const CategoryCard({
    super.key,
    required this.category,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final bool isVisible = !isCompleted;
    return Visibility(
        visible: isVisible,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            color: category.color.withOpacity(.3),
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(
                  category.icon,
                  color: category.color,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  category.name,
                  style: textTheme(12, null, null),
                )
              ],
            ),
          ),
        ));
  }
}
