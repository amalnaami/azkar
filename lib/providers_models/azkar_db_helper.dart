import 'package:azkar_app/providers_models/azkar_db_model.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class AzkarDBHelper {
  AzkarDBHelper._();

  static AzkarDBHelper taskDBHelper = AzkarDBHelper._();
  static final String pathTaskDataBase = 'task.db';
  static final String tableTask = 'tasks';
  static final String taskIdColumn = 'taskId';
  static final String taskName = 'tasksName';
  static final String taskIsComplete = 'tasksIsComplete';
  Database database;

  initTaskDataBase() async {
    if (database == null) {
      database = await connectToTaskDataBase();
    }
  }

  Future<Database> connectToTaskDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathTaskData = join(directory.path, pathTaskDataBase);
    Database database =await openDatabase(pathTaskData, version: 2, onCreate: (db, version) {
      return createTasksTable(db);
    },);
    return database;
  }

  createTasksTable(Database database) {
    database.execute('''CREATE TABLE $tableTask(
$taskIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
$taskName TEXT NOT NULL,
$taskIsComplete INTEGER NOT NULL
)''');
  }

  insertNewTask(AzkarModelDb taskModelDb) async {
    try {
      int rowNum = await database.insert(tableTask, taskModelDb.toMap());
      print(rowNum);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> selectAllTasks() async {
    try {
      List<Map<String, dynamic>> listRows = await database.query(tableTask);
      return listRows;
    } on Exception catch (e) {
      print(e);
    }
  }

  getOneTask(int taskId) async {
    List<Map<String, dynamic>> result = await database
        .query(tableTask, where: '$taskIdColumn=?', whereArgs: [taskId]);
  }

  upDataTask(AzkarModelDb taskModelDb) async {
    database.update(tableTask, taskModelDb.toMap(),
        where: '$taskIdColumn=?', whereArgs: [taskModelDb.azkarId]);
  }

  deleteTask(
    int taskId,
  ) async {
    database.delete(tableTask, where: '$taskIdColumn=?', whereArgs: [taskId]);
  }

  deleteAllTasks() async {
    database.delete(tableTask);
  }
}
