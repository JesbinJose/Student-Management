part of 'student_details_bloc.dart';

@immutable
sealed class StudentDetailsEvent {}

class AddStudent extends StudentDetailsEvent {
  final StudentModel studentModel;
  AddStudent({required this.studentModel});
}

class DeleteStudent extends StudentDetailsEvent {
  final int id;
  DeleteStudent({required this.id});
}

class UpdateStudent extends StudentDetailsEvent {
  final int id;
  final StudentModel studentModel;
  UpdateStudent( {required this.id,required this.studentModel});
}
