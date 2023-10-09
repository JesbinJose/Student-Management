// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:student_management_app_using_getx/database/sqfhelper.dart';
import 'package:student_management_app_using_getx/model/student_model.dart';
part 'student_details_event.dart';
part 'student_details_state.dart';

class StudentDetailsBloc
    extends Bloc<StudentDetailsEvent, StudentDetailsState> {
  final List<StudentModel> studentDetails;
  StudentDetailsBloc(this.studentDetails)
      : super(
          InitialState(
            studentDetails: studentDetails,
          ),
        ) {
    on<AddStudent>((event, emit) async {
      await SQFHelper.createItem(event.studentModel);
      final List<StudentModel> studentDetailsUpdated =
          await SQFHelper.getItems();
      return emit(
        UpdatedState(
          studentDetails: studentDetailsUpdated,
        ),
      );
    });

    on<DeleteStudent>((event, emit) async {
      await SQFHelper.deleteItem(event.id);
      final List<StudentModel> studentDetailsUpdated =
          await SQFHelper.getItems();
      return emit(
        UpdatedState(
          studentDetails: studentDetailsUpdated,
        ),
      );
    });

    on<UpdateStudent>((event, emit) async {
      await SQFHelper.updateItems(
        studentModel: event.studentModel,
        id: event.id,
      );
      final List<StudentModel> studentDetailsUpdated =
          await SQFHelper.getItems();
      return emit(
        UpdatedState(
          studentDetails: studentDetailsUpdated,
        ),
      );
    });
  }
}
