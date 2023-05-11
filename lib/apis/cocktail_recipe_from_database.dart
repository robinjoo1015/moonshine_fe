// // From postgreSQL database grab cocktail recipe table
//
// // Path: lib/apis/cocktail_recipe_from_database.dart
//
// // Language: dart
//
// import 'package:moonshine_fe/apis/database_helper.dart';
//
// class CocktailDatabase{
//   var dbHelper = DatabaseHelper();
//
//   Future<List<Map<String, dynamic>>> getRecipeList() async{
//     var result = await dbHelper.getRecipeList();
//     return result;
//   }
//
//   Future<List<Map<String, dynamic>>> searchRecipe(String name) async{
//     var result = await dbHelper.searchRecipe(name);
//     return result;
//   }
// }
