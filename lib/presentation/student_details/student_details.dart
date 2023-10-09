import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_app_using_getx/model/student_model.dart';
import 'package:student_management_app_using_getx/widgets/edit_delete_buttons.dart';

class StudentDetailsScreen extends StatelessWidget {
  const StudentDetailsScreen({super.key, required this.studentModel});
  final StudentModel studentModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          studentModel.name,
        ),
        actions: [
          EditDeleteButtons(
            studentDetail: studentModel,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height*0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 200,
                backgroundImage: FileImage(
                  File(
                    studentModel.img,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      content: 'Name   : ${studentModel.name}',
                    ),
                    CustomText(
                      content: 'Email  : ${studentModel.email}',
                    ),
                    CustomText(
                      content: 'Stream : ${studentModel.stream}',
                    ),
                    CustomText(
                      content: 'Parent : ${studentModel.parent}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(fontSize: 20),
    );
  }
}
