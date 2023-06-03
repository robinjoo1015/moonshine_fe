import 'package:flutter/cupertino.dart';
import 'package:moonshine_fe/apis/database_helper.dart';
import 'package:moonshine_fe/sqls/dao/image_dao.dart';
import 'package:moonshine_fe/sqls/dto/image_dto.dart';

import '../dto/cocktail_dto.dart';


class CocktailDAO{
  static List<CocktailDTO> cocktailList = [];

  CocktailDAO(){
    _getCocktailList();
  }

  void _getCocktailList() async {
    var dbConnection = await DatabaseHelper().connectDB();
    // image is defined as a foreign key in the cocktails table, row[3] is the image id
    final result = await dbConnection.query(''
        'SELECT * FROM moonshine.cocktails '
        ' INNER JOIN moonshine.image '
        ' ON moonshine.cocktails.cocktail_image = moonshine.image.image_id');
    final cocktails = result.map((row) async {
      return CocktailDTO(
        id: row[0] as int,
        name: row[1] as String,
        description: row[2] as String,
        //ImageDAO().getImageByID is Future<ImageDTO>. change it to ImageDTO
        image: await ImageDAO().getImageByID(row[3] as int),
        instructions: row[4] as String,
        createdAt: row[5] as DateTime,
        updatedAt: row[6] as DateTime,
        deletedAt: row[7] as DateTime?,
        isDeleted: row[8] as bool,
      );
    }).toList();
    for(var futureCocktail in cocktails){
      CocktailDTO cocktail = await futureCocktail;
      cocktailList.add(cocktail);
      debugPrint(cocktail.name + " " + cocktail.image.filePath);
    }

  }

  static Future<List<Map<String, String>>> getCocktailForCocktailScreen() async {
    List<Map<String, String>> returnList = [];
    for (var cocktail in cocktailList) {
      returnList.add({'name': cocktail.name, 'src': cocktail.image.filePath});
      debugPrint(cocktail.name);
    }
    return returnList;
  }
}