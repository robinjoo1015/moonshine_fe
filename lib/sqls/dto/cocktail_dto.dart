

import 'image_dto.dart';

class CocktailDTO {
  final int id;
  final String name;
  final String description;
  final ImageDTO image;
  final String instructions;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool isDeleted;

  CocktailDTO({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.instructions,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isDeleted,
  });

  void printDTO() {
    print(id.toString() + name + description + image.id.toString() + instructions);
  }


}