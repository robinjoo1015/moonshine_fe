// Database Helper opens PostgreSQLConnection

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:postgres/postgres.dart';


class DatabaseHelper{
  late PostgreSQLConnection dbConnection;

  Future<void> connectDB() async{
      dbConnection = PostgreSQLConnection('localhost', 5432, 'postgres',
          username: 'whbaek', password: 'moonshine');
      await dbConnection.open();

    debugPrint("Database Connected");
  }

  Future<List<Map<String, dynamic>>> getRecipeList() async{
    await connectDB();
    var result = await dbConnection.query('SELECT * FROM cocktail_recipe');
    List<Map<String, dynamic>> recipeList = [];
    for (var row in result) {
      recipeList.add({
        'name': row[0],
        'img': row[1],
        'ingredients': row[2],
        'recipe': row[3],
      });
    }
    return recipeList;
  }

  Future<List<Map<String, dynamic>>> searchRecipe(String name) async{
    await connectDB();
    var result = await dbConnection.query('SELECT * FROM cocktail_recipe WHERE name = @name', substitutionValues: {'name': name});
    List<Map<String, dynamic>> recipeDetail = [];
    for (var row in result) {
      recipeDetail.add({
        'name': row[0],
        'img': row[1],
        'ingredients': row[2],
        'recipe': row[3],
      });
    }
    return recipeDetail;
  }
}