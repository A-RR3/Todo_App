import 'package:flutter/material.dart';

mixin TaskFormController {
  final GlobalKey<FormState> formKey = GlobalKey();

  bool get isValidForm => formKey.currentState?.validate() ?? false;

  String? validateTitleInput(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required Field';

    if (value.isNotEmpty && value.length > 25) {
      return 'Title length should be less than or equal to 25';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required Field';
    if (value.isNotEmpty && value.length > 225) {
      return 'length should be less than or equal to 225';
    }
    return null;
  }

 void onSubmitForm() {
    if (!isValidForm) return;
  }
}
