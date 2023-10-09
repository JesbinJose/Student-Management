import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management_app_using_getx/model/student_model.dart';
import 'package:student_management_app_using_getx/presentation/student_details/student_details.dart';

class Search extends SearchDelegate {
  Search({
    required this.studentDetails,
  });
  final List<StudentModel> studentDetails;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<StudentModel> resultStudentDetails = [];
    for (final student in studentDetails) {
      if (student.name.startsWith(query)) {
        resultStudentDetails.add(student);
      }
    }
    if (resultStudentDetails.isNotEmpty) {
      return ListView.separated(
        itemBuilder: (context, index) => ListTile(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => StudentDetailsScreen(
                studentModel: studentDetails[index],
              ),
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: FileImage(
              File(
                studentDetails[index].img,
              ),
            ),
          ),
          title: Text(resultStudentDetails[index].name),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: resultStudentDetails.length,
      );
    }
    return Center(
      child: Text(
        'There are no student details starting with $query',
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<StudentModel> resultStudentDetails = [];
    for (final student in studentDetails) {
      if (student.name.startsWith(query)) {
        resultStudentDetails.add(student);
      }
    }
    if (resultStudentDetails.isNotEmpty) {
      return ListView.separated(
        itemBuilder: (context, index) => ListTile(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => StudentDetailsScreen(
                studentModel: studentDetails[index],
              ),
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: FileImage(
              File(
                studentDetails[index].img,
              ),
            ),
          ),
          title: Text(resultStudentDetails[index].name),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: resultStudentDetails.length,
      );
    }
    return Center(
      child: Text(
        'There are no student Starting with $query ',
      ),
    );
  }
}
