import 'dart:convert';

List<BasketRecord> openBasketFromJson(String str) => List<BasketRecord>.from(
    json.decode(str).map((x) => BasketRecord.fromJson(x)));

class BasketRecord {
  String collectionId;
  String collectionName;
  DateTime created;
  String id;
  bool isOpen;
  String name;
  DateTime updated;
  String user;
  int dayCount;
  String? level;

  BasketRecord({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.isOpen,
    required this.name,
    required this.updated,
    required this.user,
    required this.dayCount,
    required this.level,
  });

  factory BasketRecord.fromJson(Map<String, dynamic> json) => BasketRecord(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        id: json["id"],
        isOpen: json["isOpen"],
        name: json["name"],
        updated: DateTime.parse(json["updated"]),
        user: json["user"],
        dayCount: json["dayCount"],
        level: json["level"],
      );
}
