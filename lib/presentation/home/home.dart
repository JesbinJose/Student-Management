import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_app_using_getx/constants/constants.dart';
import 'package:student_management_app_using_getx/presentation/home/widgets/single_tile.dart';
import 'package:student_management_app_using_getx/presentation/search/search.dart';
import 'package:student_management_app_using_getx/state/students/student_details_bloc.dart';
import 'package:student_management_app_using_getx/widgets/add_or_update.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Student Details'),
        actions: [
          BlocBuilder<StudentDetailsBloc, StudentDetailsState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: Search(
                      studentDetails: state.studentDetails,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<StudentDetailsBloc, StudentDetailsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              itemBuilder: (context, index) => StudentDetailsTile(
                studentDetail: state.studentDetails[index],
              ),
              itemCount: state.studentDetails.length,
              separatorBuilder: (context, index) => kHeigth,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            elevation: 5,
            isScrollControlled: true,
            builder: (context) => MyBottomSheet(),
          ).whenComplete(() {
            KController.name.clear();
            KController.email.clear();
            KController.stream.clear();
            KController.parent.clear();
            KController.image.clear();
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
