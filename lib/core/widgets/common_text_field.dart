import 'package:flutter/material.dart';
import 'package:training_task1/core/values/colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.errorText});
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w400),
        errorText: errorText,
        errorStyle: const TextStyle(fontSize: 14, color: Colors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        filled: true,
        fillColor: greyShadow,
      ),
    );
  }
}
