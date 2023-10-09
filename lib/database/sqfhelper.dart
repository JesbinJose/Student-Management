import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:student_management_app_using_getx/model/student_model.dart';

class SQFHelper {
  static Future<void> _createTable(sql.Database database) async {
    await database.execute('''
        CREATE TABLE school(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        email TEXT,
        img TEXT,
        stream TEXT,
        parent TEXT
      )
    ''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'school.database',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await _createTable(database);
      },
    );
  }

  static Future<void> createItem(StudentModel studentModel) async {
    final db = await SQFHelper.db();
    final data = {
      'name': studentModel.name,
      'email': studentModel.email,
      'img': studentModel.img,
      'stream': studentModel.stream,
      'parent': studentModel.parent,
    };
    await db.insert(
      'school',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<StudentModel>> getItems() async {
    final db = await SQFHelper.db();
    final value = await db.query('school', orderBy: "id");
    List<StudentModel> students = [];
    for (final student in value) {
      students.add(
        StudentModel(
          id: int.parse(student['id'].toString()),
          name: student['name'].toString(),
          email: student['email'].toString(),
          img: student['img'].toString(),
          stream: student['stream'].toString(),
          parent: student['parent'].toString(),
        ),
      );
    }
    return students;
  }

  static Future<StudentModel> getItem(int id) async {
    final db = await SQFHelper.db();
    final student =
        await db.query('school', where: "id = ?", whereArgs: [id], limit: 1);
    return StudentModel(
      id: int.parse(student[0]['id'].toString()),
      name: student[0]['name'].toString(),
      email: student[0]['email'].toString(),
      img: student[0]['img'].toString(),
      stream: student[0]['stream'].toString(),
      parent: student[0]['parent'].toString(),
    );
  }

  static Future<void> updateItems({
    required StudentModel studentModel,
    required int id,
  }) async {
    final db = await SQFHelper.db();
    final data = {
      'name': studentModel.name,
      'email': studentModel.email,
      'img': studentModel.img,
      'stream': studentModel.stream,
      'parent': studentModel.parent,
    };
    db.update('school', data, where: "id = ?", whereArgs: [id]);
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQFHelper.db();
    try {
      await db.delete('school', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint("Can't delete the element $e");
    }
  }
}
