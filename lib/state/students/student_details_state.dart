part of 'student_details_bloc.dart';

class StudentDetailsState {
  final List<StudentModel> studentDetails;
  StudentDetailsState({required this.studentDetails});
}

class InitialState extends StudentDetailsState {
  InitialState({required super.studentDetails});
}

class UpdatedState extends StudentDetailsState {
  UpdatedState({required super.studentDetails});
}
