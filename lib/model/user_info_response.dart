// To parse this JSON data, do
//
//     final userInfoResponseModel = userInfoResponseModelFromJson(jsonString);

import 'dart:convert';

UserInfoResponseModel userInfoResponseModelFromJson(String str) =>
    UserInfoResponseModel.fromJson(json.decode(str));

String userInfoResponseModelToJson(UserInfoResponseModel data) =>
    json.encode(data.toJson());

class UserInfoResponseModel {
  bool? success;
  Data? data;

  UserInfoResponseModel({
    this.success,
    this.data,
  });

  factory UserInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      UserInfoResponseModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? userName;
  String? email;
  String? name;
  String? role;
  dynamic token;
  String? noHp;
  int? isVerify;
  String? gender;
  String? height;
  String? recentWeight;
  String? goalsWeight;

  Data({
    this.id,
    this.userName,
    this.email,
    this.name,
    this.role,
    this.token,
    this.noHp,
    this.isVerify,
    this.gender,
    this.height,
    this.recentWeight,
    this.goalsWeight,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userName: json["user_name"],
        email: json["email"],
        name: json["name"],
        role: json["role"],
        token: json["token"],
        noHp: json["no_hp"],
        isVerify: json["is_verify"],
        gender: json["gender"],
        height: json["height"],
        recentWeight: json["recent_weight"],
        goalsWeight: json["goals_weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "email": email,
        "name": name,
        "role": role,
        "token": token,
        "no_hp": noHp,
        "is_verify": isVerify,
        "gender": gender,
        "height": height,
        "recent_weight": recentWeight,
        "goals_weight": goalsWeight,
      };
}
