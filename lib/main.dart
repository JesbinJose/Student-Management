import 'package:flutter/material.dart';
import 'package:student_management_app_using_getx/database/sqfhelper.dart';
import 'package:student_management_app_using_getx/model/student_model.dart';
import 'package:student_management_app_using_getx/presentation/splash/splash.dart';
import 'package:student_management_app_using_getx/state/students/student_details_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    late List<StudentModel> studentDetails;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      studentDetails = await SQFHelper.getItems();
    });
    return BlocProvider(
      create: (context) => StudentDetailsBloc(
        studentDetails,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Management app using GetX',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            background: const Color.fromARGB(255, 210, 255, 211),
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
