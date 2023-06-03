import 'package:moonshine_fe/apis/database_helper.dart';
import 'package:postgres/postgres.dart';

import '../dto/image_dto.dart';

class ImageDAO {

  Future<List<ImageDTO>> getImageList() async {
    var dbConnection = await DatabaseHelper().connectDB();
    final result = await dbConnection.query('SELECT * FROM moonshine.image');
    final images = result.map((row) {
      return ImageDTO(
        id: row[0] as int,
        filePath: row[1] as String,
        createdAt: row[2] as DateTime,
        updatedAt: row[3] as DateTime,
        deletedAt: row[4] as DateTime?,
        isDeleted: row[5] as bool,
      );
    }).toList();

    return images;
  }

  Future<ImageDTO> getImageByID(int imageID) async {
    var dbConnection = await DatabaseHelper().connectDB();
    final result = await dbConnection.query('SELECT * FROM moonshine.image WHERE image_id = $imageID');
    final image = result.map((row) {
      return ImageDTO(
        id: row[0] as int,
        filePath: row[1] as String,
        createdAt: row[2] as DateTime,
        updatedAt: row[3] as DateTime,
        deletedAt: row[4] as DateTime?,
        isDeleted: row[5] as bool,
      );
    }).toList();

    return image[0];
  }
}