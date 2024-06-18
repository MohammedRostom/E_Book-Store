import 'package:flutter/material.dart';


  backFromContext(BuildContext context) {
    Navigator.of(context).pop();
  }

// Function to navigate to a screen with a given route name
   goToThisScreen({
    required BuildContext context,
    required String routeName,
    Object? arguments,
  }) {
    Navigator.of(context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

