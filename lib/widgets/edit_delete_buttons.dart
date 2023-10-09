import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app_using_getx/constants/constants.dart';
import 'package:student_management_app_using_getx/model/student_model.dart';
import 'package:student_management_app_using_getx/state/students/student_details_bloc.dart';
import 'package:student_management_app_using_getx/widgets/add_or_update.dart';

class EditDeleteButtons extends StatelessWidget {
  const EditDeleteButtons({
    super.key,
    required this.studentDetail,
  });

  final StudentModel studentDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              KController.name.text = studentDetail.name;
              KController.email.text = studentDetail.email;
              KController.parent.text = studentDetail.parent;
              KController.stream.text = studentDetail.stream;
              KController.image.text = studentDetail.img;
              showModalBottomSheet(
                context: context,
                builder: (context) => MyBottomSheet(
                  id: studentDetail.id,
                  isEdit: true,
                ),
              ).whenComplete(() {
                KController.name.clear();
                KController.email.clear();
                KController.stream.clear();
                KController.parent.clear();
                KController.image.clear();
              });
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              context.read<StudentDetailsBloc>().add(
                    DeleteStudent(
                      id: studentDetail.id,
                    ),
                  );
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
