// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Salon {
  Salon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.phone,
    required this.city,
    required this.owner,
    required this.timesOfWork,
  });

  final String id;
  final String name;
  final String imageUrl;
  final String owner;
  final String phone;
  final String city;
  final String timesOfWork;

  factory Salon.fromMap(Map<String, dynamic> json) => Salon(
        id: json["_id"],
        name: json["name"],
        owner: json["owner"],
        imageUrl: json["imageUrl"],
        phone: json["phone"],
        city: json["city"],
        timesOfWork: json["timesOfWork"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "owner": owner,
        "imageUrl": imageUrl,
        "phone": phone,
        "city": city,
        "timesOfWork": timesOfWork,
      };
}
