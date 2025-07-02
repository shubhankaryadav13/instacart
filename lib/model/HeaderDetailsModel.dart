
class HeaderDetailsModel {
  late final String Id;
  late final String title;
  late final String description;
  late final String imagePath;
  late final String status;
  late final String createdBy;

  HeaderDetailsModel({required this.Id,required this.title,required this.description,required this.imagePath,required this.status,required this.createdBy});

  factory HeaderDetailsModel.fromMap(Map<String, dynamic> map) {
      return HeaderDetailsModel(
          Id: map['Id'] ?? '',
          title: map['title'] ?? '',
          description: map['description'] ?? '',
          imagePath: map['imagePath'] ?? '',
          status: map['status'] ?? '',
          createdBy: map['createdBy'] ?? ''
      );
  }

}