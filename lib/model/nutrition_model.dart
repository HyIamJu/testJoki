import 'dart:io';

class Nutrition {
  final String id;
  final String name;
  final String link;
  final String photo;

  Nutrition({
    required this.id,
    required this.name,
    required this.link,
    required this.photo,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      id: json['id'].toString(),
      name: json['name'],
      link: json['link'],
      photo: json['photo'],
    );
  }
}

class UpdateNutritionModel {
  final String id;
  final String name;
  final String link;
  final File? photo;
  final String? mime;

  UpdateNutritionModel({
    required this.id,
    required this.name,
    required this.link,
    this.photo,
    this.mime,
  });
}
