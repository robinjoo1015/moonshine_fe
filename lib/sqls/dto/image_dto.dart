class ImageDTO {
  final int id;
  final String filePath;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  bool isDeleted;


  ImageDTO({
    required this.id,
    required this.filePath,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isDeleted,
  });

  void printDTO() {
    print(id.toString() + filePath);
  }
}