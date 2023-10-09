import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_app_using_getx/constants/constants.dart';
import 'package:student_management_app_using_getx/features/image_pick.dart';
import 'package:student_management_app_using_getx/model/student_model.dart';
import 'package:student_management_app_using_getx/state/students/student_details_bloc.dart';

// ignore: must_be_immutable
class MyBottomSheet extends StatelessWidget {
  MyBottomSheet({
    super.key,
    this.isEdit = false,
    this.id = 0,
  });
  final GlobalKey<FormState> _formKey = KController.formKey;
  final TextEditingController _nameController = KController.name;
  final TextEditingController _emailController = KController.email;
  final TextEditingController _streamController = KController.stream;
  final TextEditingController _parentNameController = KController.parent;
  final TextEditingController _imageController = KController.image;
  final bool isEdit;
  final int id;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Color.fromARGB(255, 210, 255, 211),
        ),
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 70,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Name must be at least 3 characters long';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streamController,
                decoration: const InputDecoration(labelText: 'Stream'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Stream must be at least 3 characters long';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _parentNameController,
                decoration: const InputDecoration(labelText: 'Parent Name'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Parent Name must be at least 3 characters long';
                  }
                  return null;
                },
              ),
              kHeigth,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      _imageController.text =
                          await pickImage(ImageSource.camera) ?? '';
                    },
                    child: const Text('Camera'),
                  ),
                  kWidth,
                  ElevatedButton(
                    onPressed: () async {
                      _imageController.text =
                          await pickImage(ImageSource.gallery) ?? '';
                    },
                    child: const Text('Gallary'),
                  ),
                ],
              ),
              kHeigth,
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    final newOrUpdatedModel = StudentModel(
                      //id is not needed and it is just a dummy value
                      id: id,
                      name: _nameController.text,
                      email: _emailController.text,
                      stream: _streamController.text,
                      parent: _parentNameController.text,
                      img: _imageController.text,
                    );
                    if (!isEdit) {
                      context.read<StudentDetailsBloc>().add(
                            AddStudent(
                              studentModel: newOrUpdatedModel,
                            ),
                          );
                    } else {
                      context.read<StudentDetailsBloc>().add(
                            UpdateStudent(
                              studentModel: newOrUpdatedModel,
                              id: id,
                            ),
                          );
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
