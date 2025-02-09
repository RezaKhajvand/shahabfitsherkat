import 'dart:convert';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';

class PickedSystem {
  final System system;
  final int systemSubId;

  PickedSystem({required this.system, required this.systemSubId});
}

ClubSystem clubSystemFromJson(String str) =>
    ClubSystem.fromJson(json.decode(str));

class ClubSystem {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<System> items;

  ClubSystem({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory ClubSystem.fromJson(Map<String, dynamic> json) => ClubSystem(
        page: json["page"],
        perPage: json["perPage"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        items: List<System>.from(
            json["items"].map((x) => System.fromJson(x))),
      );
}
