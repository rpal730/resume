import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume/config/core/base_viewmodel.dart';
import 'package:resume/screens/login/view/login_screen.dart';
import 'package:resume/screens/splash/view_models/splash_screen_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(
      onModelReady: (model) {
        model.navigateToLoginScreen(context);
      },
      builder: (_, model, __) => Scaffold(
        backgroundColor: Colors.amber,
        body: Center(child: Text('Splash Heading')),
      ),
    );
  }
}
