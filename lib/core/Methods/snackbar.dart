import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/style/Colors.dart';

void showSnackBar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColor.primaryColor,
      content: Text(message),
      duration: Duration(seconds: 1),
    ),
  );
}
