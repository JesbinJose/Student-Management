import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_app_using_getx/model/student_model.dart';
import 'package:student_management_app_using_getx/presentation/student_details/student_details.dart';
import 'package:student_management_app_using_getx/widgets/edit_delete_buttons.dart';

class StudentDetailsTile extends StatelessWidget {
  const StudentDetailsTile({
    super.key,
    required this.studentDetail,
  });
  final StudentModel studentDetail;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDetailsScreen(
              studentModel: studentDetail,
            ),
          ),
        ),
        leading: studentDetail.img == ''
            ? const SizedBox()
            : CircleAvatar(
                radius: 25,
                backgroundImage: FileImage(
                  File(
                    studentDetail.img,
                  ),
                ),
              ),
        title: Text(studentDetail.name),
        subtitle: Text(studentDetail.stream),
        trailing: EditDeleteButtons(studentDetail: studentDetail),
      ),
    );
  }
}
