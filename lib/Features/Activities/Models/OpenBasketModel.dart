import 'dart:convert';

OpenBasket openBasketFromJson(String str) =>
    OpenBasket.fromJson(json.decode(str));

class OpenBasket {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<BasketRecord> items;

  OpenBasket({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory OpenBasket.fromJson(Map<String, dynamic> json) => OpenBasket(
        page: json["page"],
        perPage: json["perPage"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        items: List<BasketRecord>.from(
            json["items"].map((x) => BasketRecord.fromJson(x))),
      );
}

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
