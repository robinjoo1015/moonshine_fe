// Database Helper opens PostgreSQLConnection

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:postgres/postgres.dart';


class DatabaseHelper{
  late PostgreSQLConnection dbConnection;
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper(){
    return _instance;
  }

  DatabaseHelper._internal(){
    connectDB();
  }

  Future<PostgreSQLConnection> connectDB() async{
      dbConnection = PostgreSQLConnection('localhost', 5432, 'moonshine',
          username: 'whbaek', password: 'moonshine');
      await dbConnection.open();

    debugPrint("Database Connected");
    return dbConnection;
  }

  PostgreSQLConnection getDBConnection(){
    return dbConnection;
  }
}