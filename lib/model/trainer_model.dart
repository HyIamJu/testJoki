import 'dart:io';

class Trainer {
  final String id;
  final String name;
  final String phone;
  final String photo;

  Trainer({
    required this.id,
    required this.name,
    required this.phone,
    required this.photo,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      id: json['id'].toString(),
      name: json['nama'],
      phone: json['no_hp'],
      photo: json['photo'],
    );
  }
}

class UpdateTrainerModel {
  final String id;
  final String name;
  final String phone;
  final File? photo;
  final String? mime;

  UpdateTrainerModel({
    required this.id,
    required this.name,
    required this.phone,
    this.photo,
    this.mime,
  });
}
