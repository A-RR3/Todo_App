import 'package:flutter/material.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/core/values/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.icon,
      required this.name,
      required this.color,
      required this.onTap});
  final IconData icon;
  final String name;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 17),
                        blurRadius: 17, //17
                        spreadRadius: -23, //-23
                        color: greyShadow)
                  ]),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              name,
              style: textTheme(12, null, null),
            )
          ],
        ),
      ),
    );
  }
}
