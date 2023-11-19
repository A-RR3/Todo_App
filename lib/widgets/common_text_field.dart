import 'package:flutter/material.dart';
import 'package:training_task1/core/values/colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.onChanged,
      this.maxLines,
      this.errorText});
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final void Function(String)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w300),
        errorText: errorText,
        errorStyle: const TextStyle(fontSize: 14, color: Colors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        filled: true,
        fillColor: greyShadow,
      ),
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}
