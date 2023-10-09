import 'package:flutter/material.dart';
import 'package:student_management_app_using_getx/database/sqfhelper.dart';
import 'package:student_management_app_using_getx/presentation/home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SQFHelper.getItems().then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
    return const Scaffold();
  }
}
