import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume/config/core/base_model.dart';
import 'package:resume/screens/login/view/login_screen.dart';

class SplashScreenViewModel extends BaseModel {
  navigateToLoginScreen(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        context.pushNamed(LoginScreen.routeName);
      },
    );
  }
}
